import 'dart:io';
import 'package:health/health.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/storage/local_flags_store.dart';
import '../../data/activity_repository.dart';
import '../../data/models/daily_health_metric.dart';
import 'activity_state.dart';

/// Health Connect only serves the last 30 days to an app without the extra
/// history permission, so this is also the most we can read.
const _historyDays = 30;

const _types = [HealthDataType.STEPS, HealthDataType.HEART_RATE, HealthDataType.RESTING_HEART_RATE];
const _readOnly = [HealthDataAccess.READ, HealthDataAccess.READ, HealthDataAccess.READ];

class ActivityCubit extends Cubit<ActivityState> {
  ActivityCubit({required ActivityRepository activityRepository, required LocalFlagsStore flagsStore})
    : _repository = activityRepository,
      _flagsStore = flagsStore,
      super(const ActivityState.notConnected()) {
    _restoreIfConnected();
  }

  final ActivityRepository _repository;
  final LocalFlagsStore _flagsStore;
  final Health _health = Health();

  Future<void> _restoreIfConnected() async {
    if (await _flagsStore.hasHealthConnected()) {
      await refresh();
    }
  }

  /// Asks for read access. On Android 13 and below Health Connect is a
  /// separate app — if it's missing, the user is offered to install it.
  Future<bool> connect() async {
    try {
      await _health.configure();
      if (!await _isHealthConnectAvailable()) {
        emit(const ActivityState.healthConnectMissing());
        return false;
      }
      final granted = await _health.requestAuthorization(_types, permissions: _readOnly);
      if (!granted) {
        emit(const ActivityState.error('Доступ не выдан. Разрешите nabzAI читать шаги и пульс.'));
        return false;
      }
      await _flagsStore.markHealthConnected();
      await refresh();
      return true;
    } catch (_) {
      emit(const ActivityState.error('Не удалось подключиться к Health Connect'));
      return false;
    }
  }

  /// Opens Play Store on the Health Connect page.
  Future<void> installHealthConnect() => _health.installHealthConnect();

  Future<void> refresh() async {
    emit(const ActivityState.loading());
    try {
      await _health.configure();
      if (!await _isHealthConnectAvailable()) {
        emit(const ActivityState.healthConnectMissing());
        return;
      }
      if (!(await _health.hasPermissions(_types, permissions: _readOnly) ?? false)) {
        // Revoked in system settings since last time.
        emit(const ActivityState.notConnected());
        return;
      }
      final now = DateTime.now();
      final from = DateTime(now.year, now.month, now.day - (_historyDays - 1));
      final local = await _readFromHealth(from: from, now: now);
      await _repository.syncDaily(local);
      final remote = await _repository.getRange(from: from, to: now);
      emit(ActivityState.connected(remote));
    } on ApiException catch (e) {
      emit(ActivityState.error(e.message));
    } catch (_) {
      emit(const ActivityState.error('Не удалось получить данные о здоровье'));
    }
  }

  Future<bool> _isHealthConnectAvailable() async {
    if (!Platform.isAndroid) return true;
    return await _health.getHealthConnectSdkStatus() == HealthConnectSdkStatus.sdkAvailable;
  }

  Future<List<DailyHealthMetric>> _readFromHealth({required DateTime from, required DateTime now}) async {
    final source = Platform.isIOS ? MetricSource.appleHealth : MetricSource.healthConnect;

    // Steps: one aggregate per day. Health Connect / Apple Health merge the
    // phone's and the watch's records themselves — summing raw records
    // would count the same walk twice.
    final stepsByDay = <String, int>{};
    for (var day = from; day.isBefore(now); day = DateTime(day.year, day.month, day.day + 1)) {
      final next = DateTime(day.year, day.month, day.day + 1);
      final steps = await _health.getTotalStepsInInterval(day, next.isAfter(now) ? now : next);
      if (steps != null && steps > 0) stepsByDay[_dateOnly(day)] = steps;
    }

    // Pulse: individual measurements (from a watch or manual entry).
    final points = _health.removeDuplicates(
      await _health.getHealthDataFromTypes(
        types: const [HealthDataType.HEART_RATE, HealthDataType.RESTING_HEART_RATE],
        startTime: from,
        endTime: now,
      ),
    );
    final hrByDay = <String, List<double>>{};
    final restingByDay = <String, List<double>>{};
    for (final point in points) {
      final value = point.value;
      if (value is! NumericHealthValue) continue;
      final target = point.type == HealthDataType.RESTING_HEART_RATE ? restingByDay : hrByDay;
      (target[_dateOnly(point.dateFrom)] ??= []).add(value.numericValue.toDouble());
    }

    final days = <String>{...stepsByDay.keys, ...hrByDay.keys, ...restingByDay.keys};
    return [
      for (final day in days)
        DailyHealthMetric(
          date: day,
          source: source,
          steps: stepsByDay[day],
          restingHr: _average(restingByDay[day])?.round(),
          avgHr: _average(hrByDay[day])?.round(),
          minHr: _min(hrByDay[day])?.round(),
          maxHr: _max(hrByDay[day])?.round(),
        ),
    ];
  }
}

String _dateOnly(DateTime d) {
  final local = d.toLocal();
  return '${local.year.toString().padLeft(4, '0')}-${local.month.toString().padLeft(2, '0')}-${local.day.toString().padLeft(2, '0')}';
}

double? _average(List<double>? values) =>
    values == null || values.isEmpty ? null : values.reduce((a, b) => a + b) / values.length;

double? _min(List<double>? values) => values == null || values.isEmpty ? null : values.reduce((a, b) => a < b ? a : b);

double? _max(List<double>? values) => values == null || values.isEmpty ? null : values.reduce((a, b) => a > b ? a : b);

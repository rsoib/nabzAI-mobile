import 'dart:io';
import 'package:health/health.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/storage/local_flags_store.dart';
import '../../data/activity_repository.dart';
import '../../data/models/daily_health_metric.dart';
import 'activity_state.dart';

const _historyWindow = Duration(days: 30);

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

  Future<bool> connect() async {
    try {
      _health.configure();
      const types = [HealthDataType.STEPS, HealthDataType.HEART_RATE];
      final granted = await _health.requestAuthorization(types, permissions: const [
        HealthDataAccess.READ,
        HealthDataAccess.READ,
      ]);
      if (granted) {
        await _flagsStore.markHealthConnected();
        await refresh();
      }
      return granted;
    } catch (_) {
      return false;
    }
  }

  Future<void> refresh() async {
    emit(const ActivityState.loading());
    try {
      final now = DateTime.now();
      final from = now.subtract(_historyWindow);
      final local = await _readFromHealth(from: from, to: now);
      await _repository.syncDaily(local);
      final remote = await _repository.getRange(from: from, to: now);
      emit(ActivityState.connected(remote));
    } on ApiException catch (e) {
      emit(ActivityState.error(e.message));
    } catch (_) {
      emit(const ActivityState.error('Не удалось получить данные о здоровье'));
    }
  }

  Future<List<DailyHealthMetric>> _readFromHealth({required DateTime from, required DateTime to}) async {
    final points = await _health.getHealthDataFromTypes(
      types: const [HealthDataType.STEPS, HealthDataType.HEART_RATE],
      startTime: from,
      endTime: to,
    );
    final source = Platform.isIOS ? MetricSource.appleHealth : MetricSource.healthConnect;

    final stepsByDay = <String, double>{};
    final hrByDay = <String, List<double>>{};

    for (final point in points) {
      final value = point.value;
      if (value is! NumericHealthValue) continue;
      final day = _dateOnly(point.dateFrom);
      if (point.type == HealthDataType.STEPS) {
        stepsByDay[day] = (stepsByDay[day] ?? 0) + value.numericValue.toDouble();
      } else if (point.type == HealthDataType.HEART_RATE) {
        (hrByDay[day] ??= []).add(value.numericValue.toDouble());
      }
    }

    final days = <String>{...stepsByDay.keys, ...hrByDay.keys};
    return [
      for (final day in days)
        DailyHealthMetric(
          date: day,
          source: source,
          steps: stepsByDay[day]?.round(),
          avgHr: _average(hrByDay[day])?.round(),
          minHr: _min(hrByDay[day])?.round(),
          maxHr: _max(hrByDay[day])?.round(),
        ),
    ];
  }
}

String _dateOnly(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

double? _average(List<double>? values) =>
    values == null || values.isEmpty ? null : values.reduce((a, b) => a + b) / values.length;

double? _min(List<double>? values) => values == null || values.isEmpty ? null : values.reduce((a, b) => a < b ? a : b);

double? _max(List<double>? values) => values == null || values.isEmpty ? null : values.reduce((a, b) => a > b ? a : b);

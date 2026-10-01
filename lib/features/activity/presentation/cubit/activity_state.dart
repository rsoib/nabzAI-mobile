import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/daily_health_metric.dart';

part 'activity_state.freezed.dart';

@freezed
sealed class ActivityState with _$ActivityState {
  const factory ActivityState.notConnected() = ActivityNotConnected;
  const factory ActivityState.loading() = ActivityLoading;
  const factory ActivityState.connected(List<DailyHealthMetric> metrics) = ActivityConnected;
  const factory ActivityState.error(String message) = ActivityError;
}

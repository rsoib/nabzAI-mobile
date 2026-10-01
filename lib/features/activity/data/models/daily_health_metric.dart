import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_health_metric.freezed.dart';
part 'daily_health_metric.g.dart';

enum MetricSource {
  @JsonValue('apple_health')
  appleHealth,
  @JsonValue('health_connect')
  healthConnect,
  @JsonValue('manual')
  manual,
}

/// One row of `GET/POST /me/metrics/daily`. Upserts are keyed by
/// (patientId, date, source) server-side, so re-syncing the same day never
/// creates duplicates.
@freezed
abstract class DailyHealthMetric with _$DailyHealthMetric {
  const factory DailyHealthMetric({
    required String date,
    required MetricSource source,
    int? steps,
    int? restingHr,
    int? avgHr,
    int? minHr,
    int? maxHr,
  }) = _DailyHealthMetric;

  factory DailyHealthMetric.fromJson(Map<String, dynamic> json) => _$DailyHealthMetricFromJson(json);
}

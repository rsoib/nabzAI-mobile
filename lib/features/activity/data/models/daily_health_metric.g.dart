// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_health_metric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyHealthMetric _$DailyHealthMetricFromJson(Map<String, dynamic> json) =>
    _DailyHealthMetric(
      date: json['date'] as String,
      source: $enumDecode(_$MetricSourceEnumMap, json['source']),
      steps: (json['steps'] as num?)?.toInt(),
      restingHr: (json['restingHr'] as num?)?.toInt(),
      avgHr: (json['avgHr'] as num?)?.toInt(),
      minHr: (json['minHr'] as num?)?.toInt(),
      maxHr: (json['maxHr'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DailyHealthMetricToJson(_DailyHealthMetric instance) =>
    <String, dynamic>{
      'date': instance.date,
      'source': _$MetricSourceEnumMap[instance.source]!,
      'steps': instance.steps,
      'restingHr': instance.restingHr,
      'avgHr': instance.avgHr,
      'minHr': instance.minHr,
      'maxHr': instance.maxHr,
    };

const _$MetricSourceEnumMap = {
  MetricSource.appleHealth: 'apple_health',
  MetricSource.healthConnect: 'health_connect',
  MetricSource.manual: 'manual',
};

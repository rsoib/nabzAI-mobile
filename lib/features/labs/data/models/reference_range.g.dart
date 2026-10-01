// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReferenceRange _$ReferenceRangeFromJson(Map<String, dynamic> json) =>
    _ReferenceRange(
      low: (json['low'] as num).toDouble(),
      high: (json['high'] as num).toDouble(),
      criticalLow: (json['criticalLow'] as num?)?.toDouble(),
      criticalHigh: (json['criticalHigh'] as num?)?.toDouble(),
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$ReferenceRangeToJson(_ReferenceRange instance) =>
    <String, dynamic>{
      'low': instance.low,
      'high': instance.high,
      'criticalLow': instance.criticalLow,
      'criticalHigh': instance.criticalHigh,
      'unit': instance.unit,
    };

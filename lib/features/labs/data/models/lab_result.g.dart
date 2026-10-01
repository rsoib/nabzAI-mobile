// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LabResult _$LabResultFromJson(Map<String, dynamic> json) => _LabResult(
  id: json['id'] as String,
  rawName: json['rawName'] as String,
  value: (json['value'] as num?)?.toDouble(),
  valueText: json['valueText'] as String?,
  unit: json['unit'] as String?,
  flag: $enumDecodeNullable(_$ResultFlagEnumMap, json['flag']),
  analyte:
      json['analyte'] == null
          ? null
          : LabAnalyte.fromJson(json['analyte'] as Map<String, dynamic>),
  referenceRange:
      json['referenceRange'] == null
          ? null
          : ReferenceRange.fromJson(
            json['referenceRange'] as Map<String, dynamic>,
          ),
  collectedAt: json['collectedAt'] as String?,
  confirmedByUser: json['confirmedByUser'] as bool? ?? false,
);

Map<String, dynamic> _$LabResultToJson(_LabResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rawName': instance.rawName,
      'value': instance.value,
      'valueText': instance.valueText,
      'unit': instance.unit,
      'flag': _$ResultFlagEnumMap[instance.flag],
      'analyte': instance.analyte,
      'referenceRange': instance.referenceRange,
      'collectedAt': instance.collectedAt,
      'confirmedByUser': instance.confirmedByUser,
    };

const _$ResultFlagEnumMap = {
  ResultFlag.low: 'low',
  ResultFlag.normal: 'normal',
  ResultFlag.high: 'high',
  ResultFlag.criticalLow: 'critical_low',
  ResultFlag.criticalHigh: 'critical_high',
};

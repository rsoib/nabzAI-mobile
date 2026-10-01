// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_analyte.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LabAnalyte _$LabAnalyteFromJson(Map<String, dynamic> json) => _LabAnalyte(
  code: json['code'] as String,
  nameRu: json['nameRu'] as String,
  nameTg: json['nameTg'] as String,
  unit: json['unit'] as String,
  category: json['category'] as String,
);

Map<String, dynamic> _$LabAnalyteToJson(_LabAnalyte instance) =>
    <String, dynamic>{
      'code': instance.code,
      'nameRu': instance.nameRu,
      'nameTg': instance.nameTg,
      'unit': instance.unit,
      'category': instance.category,
    };

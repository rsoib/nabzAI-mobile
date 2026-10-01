// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MedicalRecord _$MedicalRecordFromJson(Map<String, dynamic> json) =>
    _MedicalRecord(
      id: json['id'] as String,
      type: $enumDecode(_$MedicalRecordTypeEnumMap, json['type']),
      name: json['name'] as String,
      note: json['note'] as String?,
      startedAt: json['startedAt'] as String?,
      endedAt: json['endedAt'] as String?,
    );

Map<String, dynamic> _$MedicalRecordToJson(_MedicalRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$MedicalRecordTypeEnumMap[instance.type]!,
      'name': instance.name,
      'note': instance.note,
      'startedAt': instance.startedAt,
      'endedAt': instance.endedAt,
    };

const _$MedicalRecordTypeEnumMap = {
  MedicalRecordType.condition: 'condition',
  MedicalRecordType.medication: 'medication',
  MedicalRecordType.allergy: 'allergy',
  MedicalRecordType.surgery: 'surgery',
  MedicalRecordType.vaccination: 'vaccination',
};

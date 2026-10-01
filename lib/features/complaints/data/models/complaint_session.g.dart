// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ComplaintSession _$ComplaintSessionFromJson(Map<String, dynamic> json) =>
    _ComplaintSession(
      id: json['id'] as String,
      status: $enumDecode(_$ComplaintSessionStatusEnumMap, json['status']),
      urgency: $enumDecodeNullable(_$UrgencyEnumMap, json['urgency']),
      specialist: json['specialist'] as String?,
      summary: json['summary'] as String?,
      redFlags:
          (json['redFlags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      messages:
          (json['messages'] as List<dynamic>?)
              ?.map((e) => ComplaintMessage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ComplaintSessionToJson(_ComplaintSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$ComplaintSessionStatusEnumMap[instance.status]!,
      'urgency': _$UrgencyEnumMap[instance.urgency],
      'specialist': instance.specialist,
      'summary': instance.summary,
      'redFlags': instance.redFlags,
      'messages': instance.messages,
    };

const _$ComplaintSessionStatusEnumMap = {
  ComplaintSessionStatus.inProgress: 'in_progress',
  ComplaintSessionStatus.completed: 'completed',
};

const _$UrgencyEnumMap = {
  Urgency.green: 'green',
  Urgency.yellow: 'yellow',
  Urgency.red: 'red',
};

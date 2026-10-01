// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ComplaintMessage _$ComplaintMessageFromJson(Map<String, dynamic> json) =>
    _ComplaintMessage(
      id: json['id'] as String,
      role: $enumDecode(_$ComplaintMessageRoleEnumMap, json['role']),
      content: json['content'] as String,
    );

Map<String, dynamic> _$ComplaintMessageToJson(_ComplaintMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': _$ComplaintMessageRoleEnumMap[instance.role]!,
      'content': instance.content,
    };

const _$ComplaintMessageRoleEnumMap = {
  ComplaintMessageRole.user: 'user',
  ComplaintMessageRole.assistant: 'assistant',
  ComplaintMessageRole.system: 'system',
};

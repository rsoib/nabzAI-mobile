// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_scope.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShareScope _$ShareScopeFromJson(Map<String, dynamic> json) => _ShareScope(
  profile: json['profile'] as bool? ?? true,
  labs: json['labs'] as bool? ?? true,
  complaints: json['complaints'] as bool? ?? false,
  activity: json['activity'] as bool? ?? false,
);

Map<String, dynamic> _$ShareScopeToJson(_ShareScope instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'labs': instance.labs,
      'complaints': instance.complaints,
      'activity': instance.activity,
    };

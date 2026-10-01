// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShareLink _$ShareLinkFromJson(Map<String, dynamic> json) => _ShareLink(
  id: json['id'] as String,
  scope: ShareScope.fromJson(json['scope'] as Map<String, dynamic>),
  expiresAt: json['expiresAt'] as String,
  revokedAt: json['revokedAt'] as String?,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$ShareLinkToJson(_ShareLink instance) =>
    <String, dynamic>{
      'id': instance.id,
      'scope': instance.scope,
      'expiresAt': instance.expiresAt,
      'revokedAt': instance.revokedAt,
      'createdAt': instance.createdAt,
    };

_CreateShareLinkResult _$CreateShareLinkResultFromJson(
  Map<String, dynamic> json,
) => _CreateShareLinkResult(
  token: json['token'] as String,
  shareLink: ShareLink.fromJson(json['shareLink'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreateShareLinkResultToJson(
  _CreateShareLinkResult instance,
) => <String, dynamic>{
  'token': instance.token,
  'shareLink': instance.shareLink,
};

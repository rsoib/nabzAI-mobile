// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redaction_region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RedactionRegion _$RedactionRegionFromJson(Map<String, dynamic> json) =>
    _RedactionRegion(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      page: (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RedactionRegionToJson(_RedactionRegion instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'width': instance.width,
      'height': instance.height,
      'page': instance.page,
    };

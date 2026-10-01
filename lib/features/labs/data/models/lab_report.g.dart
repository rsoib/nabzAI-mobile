// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LabReport _$LabReportFromJson(Map<String, dynamic> json) => _LabReport(
  id: json['id'] as String,
  fileId: json['fileId'] as String,
  createdAt: json['createdAt'] as String,
  labName: json['labName'] as String?,
  collectedAt: json['collectedAt'] as String?,
  status: $enumDecode(_$LabReportStatusEnumMap, json['status']),
  urgency: $enumDecodeNullable(_$UrgencyEnumMap, json['urgency']),
  specialist: json['specialist'] as String?,
  explanationRu: json['explanationRu'] as String?,
  explanationTg: json['explanationTg'] as String?,
  errorMessage: json['errorMessage'] as String?,
  results:
      (json['results'] as List<dynamic>?)
          ?.map((e) => LabResult.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$LabReportToJson(_LabReport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fileId': instance.fileId,
      'createdAt': instance.createdAt,
      'labName': instance.labName,
      'collectedAt': instance.collectedAt,
      'status': _$LabReportStatusEnumMap[instance.status]!,
      'urgency': _$UrgencyEnumMap[instance.urgency],
      'specialist': instance.specialist,
      'explanationRu': instance.explanationRu,
      'explanationTg': instance.explanationTg,
      'errorMessage': instance.errorMessage,
      'results': instance.results,
    };

const _$LabReportStatusEnumMap = {
  LabReportStatus.uploaded: 'uploaded',
  LabReportStatus.processing: 'processing',
  LabReportStatus.needsReview: 'needs_review',
  LabReportStatus.confirmed: 'confirmed',
  LabReportStatus.analyzed: 'analyzed',
  LabReportStatus.failed: 'failed',
};

const _$UrgencyEnumMap = {
  Urgency.green: 'green',
  Urgency.yellow: 'yellow',
  Urgency.red: 'red',
};

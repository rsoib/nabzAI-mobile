import 'package:freezed_annotation/freezed_annotation.dart';

part 'medical_record.freezed.dart';
part 'medical_record.g.dart';

enum MedicalRecordType {
  @JsonValue('condition')
  condition,
  @JsonValue('medication')
  medication,
  @JsonValue('allergy')
  allergy,
  @JsonValue('surgery')
  surgery,
  @JsonValue('vaccination')
  vaccination,
}

@freezed
abstract class MedicalRecord with _$MedicalRecord {
  const factory MedicalRecord({
    required String id,
    required MedicalRecordType type,
    required String name,
    String? note,
    String? startedAt,
    String? endedAt,
  }) = _MedicalRecord;

  factory MedicalRecord.fromJson(Map<String, dynamic> json) => _$MedicalRecordFromJson(json);
}

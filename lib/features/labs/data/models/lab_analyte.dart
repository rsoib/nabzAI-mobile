import 'package:freezed_annotation/freezed_annotation.dart';

part 'lab_analyte.freezed.dart';
part 'lab_analyte.g.dart';

/// Reference dictionary entry, embedded on `LabResult` by the backend
/// (added specifically so the app can show a localized name instead of raw
/// OCR text — see the backend patch notes in the project README).
@freezed
abstract class LabAnalyte with _$LabAnalyte {
  const factory LabAnalyte({
    required String code,
    required String nameRu,
    required String nameTg,
    required String unit,
    required String category,
  }) = _LabAnalyte;

  factory LabAnalyte.fromJson(Map<String, dynamic> json) => _$LabAnalyteFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'reference_range.freezed.dart';
part 'reference_range.g.dart';

/// The normal-range numbers for one analyte, resolved server-side for the
/// patient's sex/age (backend patch — see project README). Null on
/// `LabResult` when no reference range is on record for that analyte; the
/// UI falls back to the qualitative `flag`-only scale in that case.
@freezed
abstract class ReferenceRange with _$ReferenceRange {
  const factory ReferenceRange({
    required double low,
    required double high,
    double? criticalLow,
    double? criticalHigh,
    required String unit,
  }) = _ReferenceRange;

  factory ReferenceRange.fromJson(Map<String, dynamic> json) => _$ReferenceRangeFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'lab_analyte.dart';
import 'reference_range.dart';

part 'lab_result.freezed.dart';
part 'lab_result.g.dart';

enum ResultFlag {
  @JsonValue('low')
  low,
  @JsonValue('normal')
  normal,
  @JsonValue('high')
  high,
  @JsonValue('critical_low')
  criticalLow,
  @JsonValue('critical_high')
  criticalHigh,
}

/// One row of `LabReport.results`. `collectedAt` is only populated by the
/// analyte-history endpoint (copied from the parent report there); it's
/// null on results embedded in a report response.
@freezed
abstract class LabResult with _$LabResult {
  const factory LabResult({
    required String id,
    required String rawName,
    double? value,
    String? valueText,
    String? unit,
    ResultFlag? flag,
    LabAnalyte? analyte,
    ReferenceRange? referenceRange,
    String? collectedAt,
    @Default(false) bool confirmedByUser,
  }) = _LabResult;

  factory LabResult.fromJson(Map<String, dynamic> json) => _$LabResultFromJson(json);
}

extension LabResultX on LabResult {
  /// Plain-language display name: prefer the dictionary translation for the
  /// active language, fall back to the raw OCR text if the analyte wasn't
  /// matched to the dictionary.
  String displayName({required bool isTajik}) {
    final a = analyte;
    if (a == null) return rawName;
    return isTajik ? a.nameTg : a.nameRu;
  }

  String get displayUnit => unit ?? analyte?.unit ?? referenceRange?.unit ?? '';

  String get displayValue => valueText ?? (value != null ? _formatNumber(value!) : '—');
}

String _formatNumber(double v) => v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toStringAsFixed(2);

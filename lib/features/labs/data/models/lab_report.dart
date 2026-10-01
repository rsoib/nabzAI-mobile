import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/models/urgency.dart';
import 'lab_result.dart';

part 'lab_report.freezed.dart';
part 'lab_report.g.dart';

enum LabReportStatus {
  @JsonValue('uploaded')
  uploaded,
  @JsonValue('processing')
  processing,
  @JsonValue('needs_review')
  needsReview,
  @JsonValue('confirmed')
  confirmed,
  @JsonValue('analyzed')
  analyzed,
  @JsonValue('failed')
  failed,
}

/// Raw shape of `GET /me/labs/reports[/:id]` and the result of
/// `PUT /me/labs/reports/:id/results` — the backend returns the `LabReport`
/// entity directly. `results` is only populated when fetched by id; the
/// list endpoint returns reports without it.
@freezed
abstract class LabReport with _$LabReport {
  const factory LabReport({
    required String id,
    required String fileId,
    required String createdAt,
    String? labName,
    String? collectedAt,
    required LabReportStatus status,
    Urgency? urgency,
    String? specialist,
    String? explanationRu,
    String? explanationTg,
    String? errorMessage,
    @Default([]) List<LabResult> results,
  }) = _LabReport;

  factory LabReport.fromJson(Map<String, dynamic> json) => _$LabReportFromJson(json);
}

extension LabReportX on LabReport {
  /// Best available date for display: when the lab drew the sample if
  /// known, otherwise when the report was uploaded.
  String get displayDate => collectedAt ?? createdAt;

  String explanation({required bool isTajik}) => (isTajik ? explanationTg : explanationRu) ?? '';

  /// uploaded/processing = OCR running; confirmed = results submitted, the
  /// analyze job is running — both read as "still working" to the user.
  bool get isProcessing =>
      status == LabReportStatus.uploaded ||
      status == LabReportStatus.processing ||
      status == LabReportStatus.confirmed;
  bool get needsReview => status == LabReportStatus.needsReview;
  bool get isReady => status == LabReportStatus.analyzed;
  bool get isFailed => status == LabReportStatus.failed;
}

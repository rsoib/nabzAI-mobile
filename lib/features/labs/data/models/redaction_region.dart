import 'package:freezed_annotation/freezed_annotation.dart';

part 'redaction_region.freezed.dart';
part 'redaction_region.g.dart';

/// A rectangle the user drew over personal data before OCR. Coordinates are
/// relative (0..1) to the page so they survive any client-side image
/// scaling. `page` is 0-indexed and only meaningful for multi-page PDFs.
/// Sent as a JSON-encoded string in the `redactionRegions` multipart field
/// — see `LabsController.uploadReport`.
@freezed
abstract class RedactionRegion with _$RedactionRegion {
  const factory RedactionRegion({
    required double x,
    required double y,
    required double width,
    required double height,
    int? page,
  }) = _RedactionRegion;

  factory RedactionRegion.fromJson(Map<String, dynamic> json) => _$RedactionRegionFromJson(json);
}

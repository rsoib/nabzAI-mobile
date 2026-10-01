import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/lab_report.dart';

part 'lab_upload_state.freezed.dart';

@freezed
sealed class LabUploadState with _$LabUploadState {
  const factory LabUploadState.idle() = LabUploadIdle;
  const factory LabUploadState.uploading({double? progress}) = LabUploadUploading;
  const factory LabUploadState.success(LabReport report) = LabUploadSuccess;
  const factory LabUploadState.error(String message) = LabUploadError;
}

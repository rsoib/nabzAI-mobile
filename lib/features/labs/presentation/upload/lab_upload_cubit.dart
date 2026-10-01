import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/api_exception.dart';
import '../../data/labs_repository.dart';
import '../../data/models/redaction_region.dart';
import 'lab_upload_state.dart';

class LabUploadCubit extends Cubit<LabUploadState> {
  LabUploadCubit({required LabsRepository labsRepository})
      : _labsRepository = labsRepository,
        super(const LabUploadState.idle());

  final LabsRepository _labsRepository;

  Future<void> upload({required File file, required List<RedactionRegion> redactionRegions}) async {
    emit(const LabUploadState.uploading());
    try {
      final report = await _labsRepository.uploadReport(
        file: file,
        redactionRegions: redactionRegions,
        onSendProgress: (sent, total) {
          if (total > 0) emit(LabUploadState.uploading(progress: sent / total));
        },
      );
      emit(LabUploadState.success(report));
    } on ApiException catch (e) {
      emit(LabUploadState.error(e.message));
    }
  }
}

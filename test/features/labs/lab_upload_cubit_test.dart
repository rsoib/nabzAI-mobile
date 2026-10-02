import 'dart:io';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:mocktail/mocktail.dart';
import 'package:untitled2/core/network/api_exception.dart';
import 'package:untitled2/features/labs/data/labs_repository.dart';
import 'package:untitled2/features/labs/data/models/lab_report.dart';
import 'package:untitled2/features/labs/presentation/upload/lab_page.dart';
import 'package:untitled2/features/labs/presentation/upload/lab_upload_cubit.dart';
import 'package:untitled2/features/labs/presentation/upload/lab_upload_state.dart';

class MockLabsRepository extends Mock implements LabsRepository {}

class FakeFile extends Fake implements File {
  @override
  String get path => '/tmp/fake.jpg';
}

void main() {
  late MockLabsRepository repository;

  setUpAll(() {
    registerFallbackValue(FakeFile());
  });

  setUp(() {
    repository = MockLabsRepository();
  });

  const report = LabReport(id: '1', fileId: 'f1', createdAt: '2026-01-01', status: LabReportStatus.processing);

  group('LabUploadCubit', () {
    blocTest<LabUploadCubit, LabUploadState>(
      'emits uploading then success',
      setUp:
          () => when(
            () => repository.uploadReport(
              file: any(named: 'file'),
              redactionRegions: any(named: 'redactionRegions'),
              onSendProgress: any(named: 'onSendProgress'),
            ),
          ).thenAnswer((_) async => report),
      build: () => LabUploadCubit(labsRepository: repository),
      act: (cubit) => cubit.upload(file: FakeFile(), redactionRegions: const []),
      expect: () => [const LabUploadState.uploading(), const LabUploadState.success(report)],
    );

    blocTest<LabUploadCubit, LabUploadState>(
      'emits error when the upload fails',
      setUp:
          () => when(
            () => repository.uploadReport(
              file: any(named: 'file'),
              redactionRegions: any(named: 'redactionRegions'),
              onSendProgress: any(named: 'onSendProgress'),
            ),
          ).thenThrow(const ApiException(message: 'Нет сети')),
      build: () => LabUploadCubit(labsRepository: repository),
      act: (cubit) => cubit.upload(file: FakeFile(), redactionRegions: const []),
      expect: () => [const LabUploadState.uploading(), const LabUploadState.error('Нет сети')],
    );
    blocTest<LabUploadCubit, LabUploadState>(
      'uploads several pages as one PDF',
      setUp:
          () => when(
            () => repository.uploadReport(
              file: any(named: 'file'),
              redactionRegions: any(named: 'redactionRegions'),
              onSendProgress: any(named: 'onSendProgress'),
            ),
          ).thenAnswer((_) async => report),
      build: () => LabUploadCubit(labsRepository: repository),
      act: (cubit) {
        final page = LabPage(bytes: img.encodeJpg(img.Image(width: 40, height: 60)), width: 40, height: 60);
        return cubit.uploadPages(pages: [page, page], redactionRegions: const []);
      },
      expect: () => [const LabUploadState.uploading(), const LabUploadState.success(report)],
      verify: (_) {
        final file =
            verify(
                  () => repository.uploadReport(
                    file: captureAny(named: 'file'),
                    redactionRegions: any(named: 'redactionRegions'),
                    onSendProgress: any(named: 'onSendProgress'),
                  ),
                ).captured.single
                as File;
        expect(file.path, endsWith('.pdf'));
        expect(String.fromCharCodes(file.readAsBytesSync().take(5)), '%PDF-');
      },
    );
  });
}

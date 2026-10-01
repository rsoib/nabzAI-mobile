import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../../core/network/api_exception.dart';
import 'models/lab_report.dart';
import 'models/lab_result.dart';
import 'models/lab_result_correction.dart';
import 'models/redaction_region.dart';

class LabsRepository {
  LabsRepository({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<LabReport> uploadReport({
    required File file,
    String? labName,
    DateTime? collectedAt,
    List<RedactionRegion> redactionRegions = const [],
    void Function(int sent, int total)? onSendProgress,
  }) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path),
        if (labName != null) 'labName': labName,
        if (collectedAt != null) 'collectedAt': collectedAt.toIso8601String(),
        if (redactionRegions.isNotEmpty)
          'redactionRegions': jsonEncode(redactionRegions.map((r) => r.toJson()).toList()),
      });
      final response = await _dio.post<Map<String, dynamic>>(
        '/me/labs/reports',
        data: formData,
        onSendProgress: onSendProgress,
      );
      return LabReport.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<List<LabReport>> list() async {
    try {
      final response = await _dio.get<List<dynamic>>('/me/labs/reports');
      return response.data!.map((e) => LabReport.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<LabReport> getById(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/me/labs/reports/$id');
      return LabReport.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<LabReport> confirmResults(String reportId, List<LabResultCorrection> corrections) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        '/me/labs/reports/$reportId/results',
        data: {'results': corrections.map((c) => c.toJson()).toList()},
      );
      return LabReport.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<List<LabResult>> getAnalyteHistory(String code) async {
    try {
      final response = await _dio.get<List<dynamic>>('/me/labs/analytes/$code/history');
      return response.data!.map((e) => LabResult.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<String> getFileSignedUrl(String fileId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/me/files/$fileId/signed-url');
      return response.data!['url'] as String;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}

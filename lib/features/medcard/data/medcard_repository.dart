import 'package:dio/dio.dart';
import '../../../core/network/api_exception.dart';
import 'models/medical_record.dart';

class MedcardRepository {
  MedcardRepository({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<List<MedicalRecord>> list() async {
    try {
      final response = await _dio.get<List<dynamic>>('/me/medical-records');
      return response.data!.map((e) => MedicalRecord.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<MedicalRecord> create({required MedicalRecordType type, required String name}) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/me/medical-records',
        data: {'type': type.name, 'name': name},
      );
      return MedicalRecord.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<void> delete(String id) async {
    try {
      await _dio.delete('/me/medical-records/$id');
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}

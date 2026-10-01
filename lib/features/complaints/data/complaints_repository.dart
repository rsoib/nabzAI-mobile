import 'package:dio/dio.dart';
import '../../../core/network/api_exception.dart';
import 'models/complaint_session.dart';

class ComplaintsRepository {
  ComplaintsRepository({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<ComplaintSession> createSession() async {
    try {
      final response = await _dio.post<Map<String, dynamic>>('/me/complaints/sessions');
      return ComplaintSession.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<ComplaintSession> getSession(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/me/complaints/sessions/$id');
      return ComplaintSession.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<ComplaintSession> postMessage(String sessionId, String content) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/me/complaints/sessions/$sessionId/messages',
        data: {'content': content},
      );
      return ComplaintSession.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}

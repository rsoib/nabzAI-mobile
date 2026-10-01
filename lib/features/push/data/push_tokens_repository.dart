import 'package:dio/dio.dart';
import '../../../core/network/api_exception.dart';

class PushTokensRepository {
  PushTokensRepository({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<void> register({required String platform, required String token}) async {
    try {
      await _dio.post('/me/push-tokens', data: {'platform': platform, 'token': token});
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<void> unregister(String token) async {
    try {
      await _dio.post('/me/push-tokens/unregister', data: {'token': token});
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}

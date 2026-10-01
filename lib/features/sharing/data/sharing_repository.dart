import 'package:dio/dio.dart';
import '../../../core/network/api_exception.dart';
import 'models/share_link.dart';
import 'models/share_scope.dart';

class SharingRepository {
  SharingRepository({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<CreateShareLinkResult> create({required ShareScope scope, required int expiresInHours}) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/me/share-links',
        data: {'expiresInHours': expiresInHours, 'scope': scope.toJson()},
      );
      return CreateShareLinkResult.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<List<ShareLink>> list() async {
    try {
      final response = await _dio.get<List<dynamic>>('/me/share-links');
      return response.data!.map((e) => ShareLink.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<void> revoke(String id) async {
    try {
      await _dio.delete('/me/share-links/$id');
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}

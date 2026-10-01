import 'package:dio/dio.dart';
import '../../../core/network/api_exception.dart';
import '../../../core/storage/secure_token_storage.dart';
import 'models/tokens_response.dart';

/// Wraps the four `/auth/*` endpoints. Saving/clearing tokens on success is
/// done here so callers (AuthCubit) only deal with app-level state.
class AuthRepository {
  AuthRepository({required Dio dio, required SecureTokenStorage tokenStorage})
      : _dio = dio,
        _tokenStorage = tokenStorage;

  final Dio _dio;
  final SecureTokenStorage _tokenStorage;

  Future<void> requestOtp(String phone) async {
    try {
      await _dio.post('/auth/otp/request', data: {'phone': phone});
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<void> verifyOtp({required String phone, required String code, String? deviceInfo}) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/auth/otp/verify',
        data: {
          'phone': phone,
          'code': code,
          if (deviceInfo != null) 'deviceInfo': deviceInfo,
        },
      );
      final tokens = TokensResponse.fromJson(response.data!);
      await _tokenStorage.saveTokens(accessToken: tokens.accessToken, refreshToken: tokens.refreshToken);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<void> logout() async {
    final refreshToken = await _tokenStorage.readRefreshToken();
    try {
      if (refreshToken != null) {
        await _dio.post('/auth/logout', data: {'refreshToken': refreshToken});
      }
    } on DioException {
      // Best-effort: even if the server call fails (offline, already
      // revoked...), the local session must still be cleared.
    } finally {
      await _tokenStorage.clear();
    }
  }
}

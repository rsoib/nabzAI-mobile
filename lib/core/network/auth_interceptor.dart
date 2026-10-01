import 'dart:async';
import 'package:dio/dio.dart';
import '../storage/secure_token_storage.dart';
import 'auth_session_events.dart';

/// Attaches the access token to every request except the public auth
/// endpoints and the doctor-facing `/shared/:token` link. On a 401, refreshes
/// the token exactly once even if several requests fail in parallel (they
/// all await the same in-flight refresh), then retries the original
/// request. If the refresh itself fails, clears the session and notifies
/// [AuthSessionEvents] so the app can drop back to the login screen.
class AuthInterceptor extends Interceptor {
  AuthInterceptor({required this.tokenStorage, required this.refreshDio});

  final SecureTokenStorage tokenStorage;

  /// A plain Dio instance (no interceptors) used only for the refresh call
  /// and for retrying the original request — reusing the intercepted Dio
  /// here would recurse back into this same interceptor.
  final Dio refreshDio;

  Completer<String?>? _refreshCompleter;

  static const _publicPathSegments = ['/auth/otp/request', '/auth/otp/verify', '/auth/refresh', '/auth/logout'];

  bool _isPublic(String path) =>
      _publicPathSegments.any(path.contains) || path.contains('/shared/');

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!_isPublic(options.path)) {
      final token = await tokenStorage.readAccessToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final path = err.requestOptions.path;
    if (err.response?.statusCode != 401 || _isPublic(path)) {
      handler.next(err);
      return;
    }

    final newAccessToken = await _refreshTokens();
    if (newAccessToken == null) {
      await tokenStorage.clear();
      AuthSessionEvents.instance.notifyForcedLogout();
      handler.next(err);
      return;
    }

    try {
      final retryOptions = err.requestOptions;
      retryOptions.headers['Authorization'] = 'Bearer $newAccessToken';
      final retryResponse = await refreshDio.fetch(retryOptions);
      handler.resolve(retryResponse);
    } on DioException catch (retryError) {
      handler.next(retryError);
    }
  }

  Future<String?> _refreshTokens() {
    final inFlight = _refreshCompleter;
    if (inFlight != null) return inFlight.future;

    final completer = Completer<String?>();
    _refreshCompleter = completer;
    _performRefresh().then(completer.complete).whenComplete(() => _refreshCompleter = null);
    return completer.future;
  }

  Future<String?> _performRefresh() async {
    final refreshToken = await tokenStorage.readRefreshToken();
    if (refreshToken == null) return null;

    try {
      final response = await refreshDio.post<Map<String, dynamic>>(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
      );
      final data = response.data!;
      final accessToken = data['accessToken'] as String;
      final newRefreshToken = data['refreshToken'] as String;
      await tokenStorage.saveTokens(accessToken: accessToken, refreshToken: newRefreshToken);
      return accessToken;
    } on DioException {
      return null;
    }
  }
}

import 'package:dio/dio.dart';
import '../config/app_config.dart';
import '../storage/secure_token_storage.dart';
import 'auth_interceptor.dart';

/// Builds the app's single Dio instance. All feature repositories share it
/// so the auth interceptor's token attach/refresh logic applies uniformly.
class ApiClient {
  const ApiClient._();

  static Dio create({required AppConfig config, required SecureTokenStorage tokenStorage}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: config.apiBaseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 20),
        headers: const {'Accept': 'application/json'},
      ),
    );

    // Separate, un-intercepted client for the refresh call itself and for
    // retrying a request after refresh — reusing `dio` here would recurse
    // back into AuthInterceptor.
    final refreshDio = Dio(BaseOptions(baseUrl: config.apiBaseUrl));

    dio.interceptors.add(AuthInterceptor(tokenStorage: tokenStorage, refreshDio: refreshDio));

    if (config.flavor == Flavor.dev) {
      // Never log headers/bodies: tokens live in headers, medical data in
      // bodies. Method + path + status is enough for local debugging.
      dio.interceptors.add(
        LogInterceptor(
          requestHeader: false,
          responseHeader: false,
          requestBody: false,
          responseBody: false,
        ),
      );
    }

    return dio;
  }
}

import 'package:dio/dio.dart';

/// Normalized error surfaced to cubits/UI. Nest's default exception filter
/// returns `{statusCode, message, error}` where `message` is either a plain
/// string or an array of class-validator messages — both are handled here.
class ApiException implements Exception {
  const ApiException({required this.message, this.statusCode});

  final String message;
  final int? statusCode;

  bool get isOffline => statusCode == null;
  bool get isUnauthorized => statusCode == 401;
  bool get isNotFound => statusCode == 404;

  factory ApiException.fromDioException(DioException e) {
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return const ApiException(message: 'Проверьте подключение к интернету');
    }

    final response = e.response;
    if (response == null) {
      return const ApiException(message: 'Что-то пошло не так. Попробуйте ещё раз');
    }

    final data = response.data;
    String message = 'Что-то пошло не так. Попробуйте ещё раз';
    if (data is Map) {
      final raw = data['message'];
      if (raw is String) {
        message = raw;
      } else if (raw is List && raw.isNotEmpty) {
        message = raw.join(', ');
      }
    }
    return ApiException(message: message, statusCode: response.statusCode);
  }

  @override
  String toString() => message;
}

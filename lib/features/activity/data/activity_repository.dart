import 'package:dio/dio.dart';
import '../../../core/network/api_exception.dart';
import 'models/daily_health_metric.dart';

String _dateOnly(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

class ActivityRepository {
  ActivityRepository({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<void> syncDaily(List<DailyHealthMetric> items) async {
    if (items.isEmpty) return;
    try {
      await _dio.post('/me/metrics/daily', data: {'items': items.map((e) => e.toJson()).toList()});
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<List<DailyHealthMetric>> getRange({required DateTime from, required DateTime to}) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        '/me/metrics/daily',
        queryParameters: {'from': _dateOnly(from), 'to': _dateOnly(to)},
      );
      return response.data!.map((e) => DailyHealthMetric.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}

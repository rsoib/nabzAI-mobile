import 'package:dio/dio.dart';
import '../../../core/network/api_exception.dart';
import 'models/patient_profile.dart';

class ProfileRepository {
  ProfileRepository({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<PatientProfile> getMyProfile() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/me/profile');
      return PatientProfile.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<PatientProfile> updateMyProfile({
    String? fullName,
    Sex? sex,
    String? birthDate,
    AppLanguage? language,
    double? heightCm,
    double? weightKg,
  }) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        '/me/profile',
        data: {
          if (fullName != null) 'fullName': fullName,
          if (sex != null) 'sex': sex.name,
          if (birthDate != null) 'birthDate': birthDate,
          if (language != null) 'language': language.name,
          if (heightCm != null) 'heightCm': heightCm,
          if (weightKg != null) 'weightKg': weightKg,
        },
      );
      return PatientProfile.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}

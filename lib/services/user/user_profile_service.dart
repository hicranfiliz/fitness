import 'package:dio/dio.dart';
import 'package:fitness/services/api_service_dart.dart';

class ProfileService {
  final ApiService _apiService;

  ProfileService(this._apiService);

  Future<Response> updateUserProfile({
    required String userId,
    required String gender,
    required DateTime dateOfBirth,
    required double weight,
    required double height,
  }) async {
    final data = {
      'userId': userId,
      'gender': gender,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'weight': weight,
      'height': height,
    };
    try {
      Response response = await _apiService.dio.post(
        '/updateProfile',
        data: data,
      );
      return response;
    } on DioException catch (e) {
      // Hata yönetimi
      rethrow;
    }
  }
}

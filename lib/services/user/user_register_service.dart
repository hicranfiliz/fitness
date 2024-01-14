import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fitness/services/api_service_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterService {
  final ApiService _apiService;

  RegisterService(this._apiService);

  Future<bool> registerUser({
    required String name,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final data = jsonEncode({
      'name': name,
      'lastName': lastName,
      'email': email,
      'password': password,
    });
    try {
      Response response = await _apiService.dio.post(
        '/register',
        data: data,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode == 201) {
        // Response içinden userId al ve SharedPreferences'a kaydet.
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String userId = response.data['userId'];
        await prefs.setString('userId', userId);
        return true; // Kayıt başarılı
      } else {
        return false; // Kayıt başarısız
      }
    } on DioException catch (e) {
      print(e.response?.data); // Sunucunun döndürdüğü hata mesajını yazdır
      rethrow; // Hata üst katmana ilet
    }
  }
}

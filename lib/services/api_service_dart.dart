import 'package:dio/dio.dart';

class ApiService {
  late Dio _dio;

  ApiService() {
    _dio = Dio(BaseOptions(
        baseUrl: 'http://192.168.1.8:3000',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5)));
    // Burada daha fazla Dio yapılandırması yapabilirsiniz.
  }

  Dio get dio => _dio;
}

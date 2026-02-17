import 'package:dio/dio.dart';
import 'package:ecomerce_app/core/storage/token_storage.dart';

class ApiClient {
  late Dio dio;

  ApiClient(TokenStorage tokenStorage) {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://172.20.10.2:8080',
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          try {
            final token = await tokenStorage.getToken();
            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          } catch (_) {}
          return handler.next(options);
        },
      ),
    );
  }
}

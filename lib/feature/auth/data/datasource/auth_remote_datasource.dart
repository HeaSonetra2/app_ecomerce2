import 'package:dio/dio.dart';
import 'package:ecomerce_app/core/network/api_client.dart';

class AuthRemoteDatasource {
  final ApiClient apiClient;

  AuthRemoteDatasource(this.apiClient);

  Future<String> login(String phone, String password) async {
    try {
      final respone = await apiClient.dio.post(
        '/auth/login',
        data: {"phoneNumber": phone, "password": password},
      );

      if (respone.data['success'] == true) {
        return respone.data['data']['token'];
      } else {
        throw Exception(respone.data['message']);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Login failed');
    }
  }

  Future<Map<String, dynamic>> register(
    String phone,
    String password,
    String name,
  ) async {
    await Future.delayed(const Duration(seconds: 1));

    return {"id": '1', "phone": "0987654321", "name": "Netra"};
  }

  Future<void> resetPassword(String phone, String newPassword) async {
    await Future.delayed(const Duration(seconds: 1));
    //Mock data
  }
}

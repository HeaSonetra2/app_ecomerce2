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

  Future<Map<String,dynamic>> sendRequestOTP(
    String phone,
  ) async {
    try{
      final respone = await apiClient.dio.post(
        '/auth/register/send-otp',
        data: {"phoneNumber": phone},
      );
       if(respone.data['success']== true){
         return respone.data;
       }else{
        throw Exception(respone.data['message']);
       }

    }on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Login failed');
    }
  }

  Future<Map<String, dynamic>> verifyOTP(
    String phone,
    String otp,
  ) async {
    try{
      final respone = await apiClient.dio.post(
        '/auth/register/verify-otp',
        data: {
          "phoneNumber": phone,
          "otp":otp
        },
      );
       if(respone.data['success']== true){
         return respone.data;
       }else{
        throw Exception(respone.data['message']);
       }
    }on DioException catch (e){
      throw Exception(e.response?.data['message'] ?? 'Login failed');
    }
  }

  Future<Map<String, dynamic>> register(
    String phone,
    String otp,
    String password,
    String confirm,
    String name,
    String gender,
    String dob,
    
  ) async {
    try{
      final respone = await apiClient.dio.post(
        '/auth/register',
        data: {
          "phoneNumber": phone,
          "otp":otp,
          "password":password,
          "confirmPassword":confirm,
          "name":name,
          "gender":gender,
          "dob":dob
        },
      );
       if(respone.data['success']== true){
         return respone.data;
       }else{
        throw Exception(respone.data['message']);
       }
    }on DioException catch (e){
      throw Exception(e.response?.data['message'] ?? 'Login failed');
    }
  }



  Future<void> resetPassword(String phone, String newPassword) async {
    await Future.delayed(const Duration(seconds: 1));
    //Mock data
  }
}

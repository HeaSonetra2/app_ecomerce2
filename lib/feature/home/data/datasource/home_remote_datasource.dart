import 'package:dio/dio.dart';
import 'package:ecomerce_app/core/network/api_client.dart';

class HomeRemoteDatasource {
  final ApiClient apiClient;

  HomeRemoteDatasource(this.apiClient);

  Future<Map<String, dynamic>> getHome() async {
    try {
      final respone = await apiClient.dio.get('/api/v1/home');
      print("RESPONSE DATA: ${respone.data}");
      // Debug print
      if (respone.data['success'] == true) {
        return respone.data;
      } else {
        throw Exception(respone.data['message']);
      }
    } on DioException catch (e) {
      print("DIO ERROR: ${e.message}");
      print("STATUS CODE: ${e.response?.statusCode}");
      print("RESPONSE DATA: ${e.response?.data}");
      throw Exception(
        e.response?.data?['message'] ?? e.message ?? 'Failed to load home data',
      );
    }
  }

  Future<Map<String, dynamic>> getFeedDetail(String Id) async {
    try {
      final respone = await apiClient.dio.get('/api/v1/products/feed/$Id');
      print("RESPONSE DATA: ${respone.data}");
      // Debug print
      if (respone.data['success'] == true) {
        return respone.data;
      } else {
        throw Exception(respone.data['message']);
      }
    } on Exception catch (e) {
      throw Exception('Failed to load feed detail: $e');
    }
  }
}

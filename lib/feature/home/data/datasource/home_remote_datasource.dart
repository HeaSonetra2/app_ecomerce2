import 'package:dio/dio.dart';
import 'package:ecomerce_app/core/network/api_client.dart';

class HomeRemoteDatasource {
  final ApiClient apiClient;

  HomeRemoteDatasource(this.apiClient);

  Future<Map<String, dynamic>> getHome() async {
    try {
      final respone = await apiClient.dio.get('/api/v1/home');
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
    await Future.delayed(Duration(seconds: 2));

    //dio.get('api/v1/product/feed/{id}')
    //mock data
    return {
      'id': Id,
      'name': 'Banana',
      'qty': 7,
      'stock_qty': 7,
      'type': 'pcs',
      'price': 5.5,
      'desc':
          'Hellovgbhjknmjhvggggggggggggggghhhhhfcgnnnnnnnnnnnnnnt7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff',
      'isFav': true,
      'nutrition': 5.5,
      'review': 4.0,
      'imageUrl':
          'https://www.dole.com/sites/default/files/styles/512w384h-80/public/media/orange-wissen.jpg?itok=i9A3Dx0Q-22EZBL72',
    };
  }
}

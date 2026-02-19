

import 'package:ecomerce_app/core/network/api_client.dart';

class CartRemoteDatasource {
    final ApiClient apiClient;

  CartRemoteDatasource(this.apiClient);
  
  Future<Map<String, dynamic>> getCartDetail() async {
    try {
      final respone = await apiClient.dio.get('/api/v1/cart');
      print("RESPONSE DATA: ${respone.data}");
      // Debug print
      if (respone.data['success'] == true) {
        return respone.data['data'];
      } else {
        throw Exception('Failed to load order detail');
      }
    } catch (e) {
      print("Error fetching order detail: $e");
      throw Exception('Failed to load order detail');
    }
  }
}
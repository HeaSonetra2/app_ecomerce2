

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
  Future<Map<String, dynamic>> updateQtyCart(int productId, int quantity) async {
    try {
      final respone = await apiClient.dio.put('/api/v1/cart/items/$productId', data: {
        'quantity': quantity,
      });
      print("RESPONSE DATA: ${respone.data}");
      // Debug print
      if (respone.data['success'] == true) {
        return respone.data['data'];
      } else {
        throw Exception('Failed to update cart quantity');
      }
    } catch (e) {
      print("Error updating cart quantity: $e");
      throw Exception('Failed to update cart quantity');
    }
  }


}
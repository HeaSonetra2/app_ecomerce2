import 'package:ecomerce_app/core/network/api_client.dart';
import 'package:ecomerce_app/feature/account/data/model/profile_model.dart';

class ProfileRemoteDataSource {
  final ApiClient apiClient;
  ProfileRemoteDataSource(this.apiClient);

  Future<Map<String, dynamic>> getProfile() async {
    try {
      final response = await apiClient.dio.get('/api/v1/users/me');
      if (response.data['success'] == true) {
        return response.data;
      } else {
        throw Exception(response.data['message']);
      }
    }on Exception catch (e) {
      throw Exception('Failed to load profile: $e');
    }
  }
}

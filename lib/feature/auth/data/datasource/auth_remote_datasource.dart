class AuthRemoteDatasource {
  Future<Map<String, dynamic>> login(String phone, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (phone == "0987654321" && password == "123456") {
      return {"id": '1', "phone": "0987654321", "name": "Netra"};
    } else {
      throw Exception('Invalid Credentials');
    }
  }
}
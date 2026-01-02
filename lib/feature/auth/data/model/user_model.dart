import 'package:ecomerce_app/feature/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.id, required super.phone, required super.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json['id'], phone: json['phone'], name: json['name']);
  }
}

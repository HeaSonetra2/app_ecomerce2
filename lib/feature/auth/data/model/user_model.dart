import 'package:ecomerce_app/feature/auth/domain/entities/user.dart';
//Dto
class UserModel extends User {
  UserModel({required super.id, required super.phone, required super.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json['id'], phone: json['phone'].toString(), name: json['name']);
  }
}

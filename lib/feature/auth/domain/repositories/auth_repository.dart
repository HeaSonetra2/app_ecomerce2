
import 'package:ecomerce_app/feature/auth/domain/entities/user.dart';

abstract class AuthRepository {
 
  Future<User> login({
    required String phone,
    required String password
  });
}
import 'package:ecomerce_app/feature/auth/domain/entities/user.dart';
import 'package:ecomerce_app/feature/auth/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase({required this.repository});

  Future<User> call(String phone, String password) {
    return repository.login(phone: phone, password: password);
  }
}

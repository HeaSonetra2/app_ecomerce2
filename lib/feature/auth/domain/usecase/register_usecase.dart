import 'package:ecomerce_app/feature/auth/domain/entities/user.dart';
import 'package:ecomerce_app/feature/auth/domain/repositories/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository repository;
  RegisterUsecase(this.repository);

  Future<User> call(String phone, String password,String name) {
    return repository.register(phone: phone, password: password,name:name);
  }
}

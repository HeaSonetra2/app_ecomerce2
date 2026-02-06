import 'package:ecomerce_app/feature/auth/data/model/register_model.dart';
import 'package:ecomerce_app/feature/auth/domain/repositories/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository repository;
  RegisterUsecase(this.repository);

  Future<RegisterModel> call(
    String phone,
    String otp,
    String password,
    String confirm,
    String name,
    String gender,
    String dob,
  ) {
    return repository.register(
      phone: phone,
      otp: otp,
      password: password,
      confirm: confirm,
      name: name,
      gender: gender,
      dob: dob,
    );
  }
}

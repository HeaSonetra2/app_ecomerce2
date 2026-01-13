import 'package:ecomerce_app/feature/auth/domain/repositories/auth_repository.dart';

class ResetPasswordUsecase {
  final AuthRepository repository;

  ResetPasswordUsecase({required this.repository});

  Future<void> call(String phone, String password) {
    return repository.resetPassword(phone, password);
  }
}

import 'package:ecomerce_app/feature/auth/data/model/verify_otp_model.dart';
import 'package:ecomerce_app/feature/auth/domain/repositories/auth_repository.dart';

class VerifyOtpUsecase {
  final AuthRepository repository;

  VerifyOtpUsecase(this.repository);

  Future<VerifyOtpModel> call(String phone, String otp) {
    return repository.verifyOtp(phone, otp);
  }
}

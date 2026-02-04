import 'package:ecomerce_app/feature/auth/data/model/otp_sent_model.dart';
import 'package:ecomerce_app/feature/auth/domain/repositories/auth_repository.dart';

class OtpSendUsecase {
  final AuthRepository repository;

  OtpSendUsecase( this.repository);

  Future<OtpSentModel> call(String phone) {
    return repository.sendOtp(phone);
  }
}

import 'package:ecomerce_app/feature/auth/data/model/otp_sent_model.dart';
import 'package:ecomerce_app/feature/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<String> login({required String phone, required String password});

  Future<User> register({
    required String phone,
    required String password,
    required String name,
  });

  Future<OtpSentModel> sendOtp(String phone);
  Future<bool> verifyOtp(String phone, String Otp);

  Future<void> resetPassword(String phone, String password);
}

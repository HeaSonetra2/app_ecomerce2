import 'package:ecomerce_app/feature/auth/data/model/otp_sent_model.dart';
import 'package:ecomerce_app/feature/auth/data/model/register_model.dart';
import 'package:ecomerce_app/feature/auth/data/model/verify_otp_model.dart';

abstract class AuthRepository {
  Future<String> login({required String phone, required String password});

  Future<RegisterModel> register({
    required String phone,
    required String otp,
    required String password,
    required String confirm,
    required String name,
    required String gender,
    required String dob,
  });

  Future<OtpSentModel> sendOtp(String phone);
  Future<VerifyOtpModel> verifyOtp(String phone, String otp);

  Future<void> resetPassword(String phone, String password);
}

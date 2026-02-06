import 'package:ecomerce_app/feature/auth/data/datasource/auth_remote_datasource.dart';
import 'package:ecomerce_app/feature/auth/data/model/otp_sent_model.dart';
import 'package:ecomerce_app/feature/auth/data/model/register_model.dart';
import 'package:ecomerce_app/feature/auth/data/model/user_model.dart';
import 'package:ecomerce_app/feature/auth/data/model/verify_otp_model.dart';
import 'package:ecomerce_app/feature/auth/domain/entities/user.dart';
import 'package:ecomerce_app/feature/auth/domain/repositories/auth_repository.dart';

class RepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remote;

  RepositoryImpl(this.remote);

  @override
  Future<String> login({
    required String phone,
    required String password,
  }) async {
    final json = await remote.login(phone, password);
    return json;
  }

  @override
  Future<OtpSentModel> sendOtp(String phone) async {
    final json = await remote.sendRequestOTP(phone);
    return OtpSentModel.fromJson(json);
  } //Logic SMS

  @override
  Future<VerifyOtpModel> verifyOtp(String phone, String otp) async {
    final json = await remote.verifyOTP(phone, otp);
    return VerifyOtpModel.fromJson(json);
  }

  @override
  Future<void> resetPassword(String phone, String password) {
    return remote.resetPassword(phone, password);
  }

  @override
  Future<RegisterModel> register({
    required String phone,
    required String otp,
    required String password,
    required String confirm,
    required String name,
    required String gender,
    required String dob,
  }) async {
    final json = await remote.register(
      phone,
      otp,
      password,
      confirm,
      name,
      gender,
      dob,
    );
    return RegisterModel.fromJson(json);
  }
}

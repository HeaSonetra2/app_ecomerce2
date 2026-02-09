import 'package:ecomerce_app/feature/auth/presentation/bloc/state.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String phone;
  final String password;

  LoginEvent({required this.phone, required this.password});
}

class SendOtpEvent extends AuthEvent {
  final String phone;

  SendOtpEvent({required this.phone});
}

class VerifyOtpEvent extends AuthEvent {
  final String phone;
  final String otp;

  VerifyOtpEvent(this.phone, this.otp);
}

class CompleteRegisterEvent extends AuthEvent {
  final String phone;
  final String otp;
  final String password;
  final String confirm;
  final String name;
  final String gender;
  final String dob;

  CompleteRegisterEvent({required this.phone, required this.otp, required this.password, required this.confirm, required this.name, required this.gender, required this.dob});


}

class ResetPasswordEvent extends AuthEvent {
  final String phone;
  final String otp;
  final String newPass;
  final String confirmPass;

  ResetPasswordEvent({
    required this.phone,
    required this.otp,
    required this.newPass,
    required this.confirmPass,
  });
}

class VerifyOtpForResetEvent extends AuthEvent {
  final String phone;
  final String otp;

  VerifyOtpForResetEvent({required this.phone, required this.otp});
}

class ForgotPasswordEvent extends AuthEvent {
  final String phone;

  ForgotPasswordEvent({required this.phone});
}

class CheckAuthEvent extends AuthEvent {}

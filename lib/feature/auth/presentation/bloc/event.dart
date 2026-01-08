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
  final String otp;

  VerifyOtpEvent({required this.otp});
}

class CompleteRegisterEvent extends AuthEvent {
  final String phone, password, name;

  CompleteRegisterEvent({
    required this.phone,
    required this.password,
    required this.name,
  });
}

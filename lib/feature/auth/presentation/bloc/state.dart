abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String name;

  AuthSuccess({required this.name});
}
class RegisterSuccess extends AuthState {
  final String phone;

  RegisterSuccess({required this.phone});
}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}

class OtpSentSuccess extends AuthState {
  final String otp;

  OtpSentSuccess({required this.otp});

}

class OtpVerifySuccess extends AuthState {
  final String message;

  OtpVerifySuccess({required this.message});
}

class OtpSendForResetSuccess extends AuthState {}

class OtpVerifyForResetSuccess extends AuthState {}

class PasswordSuccess extends AuthState {
  final String message;

  PasswordSuccess({required this.message});
}

class AuthAuthenticated extends AuthState {}

class AuthUnauthenticated extends AuthState {}

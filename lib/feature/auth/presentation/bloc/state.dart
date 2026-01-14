abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String name;

  AuthSuccess({required this.name});
}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}

class OtpSentSuccess extends AuthState {}

class OtpVerifySuccess extends AuthState {}

class OtpSendForResetSuccess extends AuthState {}

class OtpVerifyForResetSuccess extends AuthState {}

class PasswordSuccess extends AuthState {
  final String message;

  PasswordSuccess({required this.message});
}

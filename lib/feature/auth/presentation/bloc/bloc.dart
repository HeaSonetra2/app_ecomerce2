import 'dart:math';

import 'package:ecomerce_app/feature/auth/domain/usecase/login_usecase.dart';
import 'package:ecomerce_app/feature/auth/domain/usecase/register_usecase.dart';
import 'package:ecomerce_app/feature/auth/domain/usecase/reset_password_usecase.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/event.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;
  final ResetPasswordUsecase resetPasswordUsecase;

  AuthBloc(this.loginUsecase, this.registerUsecase, this.resetPasswordUsecase)
    : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        final token = await loginUsecase(event.phone, event.password);
        emit(AuthSuccess(name: token));
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });

    on<SendOtpEvent>((event, emit) async {
      emit(AuthLoading());

      await Future.delayed(Duration(seconds: 2));
      emit(OtpSentSuccess());
    });

    on<VerifyOtpEvent>((event, emit) async {
      emit(AuthLoading());

      if (event.otp == '1234') {
        //Mock Otp
        emit(OtpVerifySuccess());
      } else {
        emit(AuthError(message: 'Invalid OTP'));
      }
    });

    on<CompleteRegisterEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await registerUsecase(
          event.phone,
          event.password,
          event.name,
        );
        emit(AuthSuccess(name: user.name));
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });

    on<VerifyOtpForResetEvent>((event, emit) async {
      emit(AuthLoading());

      if (event.otp == '1234') {
        //Mock Otp
        emit(OtpVerifyForResetSuccess());
      } else {
        emit(AuthError(message: 'Invalid OTP'));
      }
    });

    on<ForgotPasswordEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        emit(OtpSendForResetSuccess());
      } catch (e) {
         emit(AuthError(message: 'Invalid OTP'));
      }
    });

    on<ResetPasswordEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        if (event.newPass.length < 6) {
          emit(AuthError(message: 'Password must be at least 6 characters'));
          return;
        }

        if (event.newPass != event.confirmPass) {
          emit(AuthError(message: 'Password do not match'));
          return;
        }

        await resetPasswordUsecase(event.phone, event.newPass);
        emit(PasswordSuccess(message: 'Welcome To Home'));
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });
  }
}

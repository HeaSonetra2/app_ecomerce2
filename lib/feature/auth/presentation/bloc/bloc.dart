import 'package:ecomerce_app/feature/auth/domain/usecase/login_usecase.dart';
import 'package:ecomerce_app/feature/auth/domain/usecase/register_usecase.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/event.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;

  AuthBloc(this.loginUsecase, this.registerUsecase) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        final user = await loginUsecase(event.phone, event.password);
        emit(AuthSuccess(name: user.name));
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
  }
}

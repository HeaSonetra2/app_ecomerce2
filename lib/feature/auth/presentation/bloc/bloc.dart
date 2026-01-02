import 'package:ecomerce_app/feature/auth/domain/usecase/login_usecase.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/event.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;

  AuthBloc(this.loginUsecase) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        final user = await loginUsecase(event.phone, event.password);
        emit(AuthSuccess(name: user.name));
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });
  }
}

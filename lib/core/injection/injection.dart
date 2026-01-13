import 'package:ecomerce_app/feature/auth/data/datasource/auth_remote_datasource.dart';
import 'package:ecomerce_app/feature/auth/data/repositories/repository_Impl.dart';
import 'package:ecomerce_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:ecomerce_app/feature/auth/domain/usecase/login_usecase.dart';
import 'package:ecomerce_app/feature/auth/domain/usecase/register_usecase.dart';
import 'package:ecomerce_app/feature/auth/domain/usecase/reset_password_usecase.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(() => AuthBloc(sl(), sl(),sl()));

  //UseCase
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => RegisterUsecase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUsecase(repository: sl()));

  //Repository (interface+Impl)
  sl.registerLazySingleton<AuthRepository>(() => RepositoryImpl(sl()));

  sl.registerLazySingleton(() => AuthRemoteDatasource());
}

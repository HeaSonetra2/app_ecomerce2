import 'package:ecomerce_app/core/network/api_client.dart';
import 'package:ecomerce_app/core/storage/token_storage.dart';
import 'package:ecomerce_app/feature/account/data/datasource/remote_datasource.dart';
import 'package:ecomerce_app/feature/account/data/repository/profile_repo_Impl.dart';
import 'package:ecomerce_app/feature/account/domain/repository/profile_repo.dart';
import 'package:ecomerce_app/feature/account/domain/usecase/get_profile_usecase.dart';
import 'package:ecomerce_app/feature/account/presentation/bloc/profile_bloc.dart';
import 'package:ecomerce_app/feature/auth/data/datasource/auth_remote_datasource.dart';
import 'package:ecomerce_app/feature/auth/data/model/otp_sent_model.dart';
import 'package:ecomerce_app/feature/auth/data/repositories/repository_Impl.dart';
import 'package:ecomerce_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:ecomerce_app/feature/auth/domain/usecase/login_usecase.dart';
import 'package:ecomerce_app/feature/auth/domain/usecase/otp_send_usecase.dart';
import 'package:ecomerce_app/feature/auth/domain/usecase/register_usecase.dart';
import 'package:ecomerce_app/feature/auth/domain/usecase/reset_password_usecase.dart';
import 'package:ecomerce_app/feature/auth/domain/usecase/verify_otp_usecase.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/bloc.dart';
import 'package:ecomerce_app/feature/home/data/datasource/home_remote_datasource.dart';
import 'package:ecomerce_app/feature/home/data/repository_Impl/home_repo_Impl.dart';
import 'package:ecomerce_app/feature/home/domain/repository/home_repo.dart';
import 'package:ecomerce_app/feature/home/domain/usecase/get_feed_detail_usecase.dart';
import 'package:ecomerce_app/feature/home/domain/usecase/home_usecase.dart';
import 'package:ecomerce_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(() => AuthBloc(sl(), sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory(() => HomeBloc(sl(), sl()));
  sl.registerFactory(() => ProfileBloc(getProfileUsecase: sl()));
  sl.registerLazySingleton<TokenStorage>(() => TokenStorage());
  sl.registerLazySingleton(() => ApiClient(sl()));

  //UseCase
  sl.registerLazySingleton(() => HomeUsecase(homeRepo: sl()));
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => OtpSendUsecase(sl()));
  sl.registerLazySingleton(() => VerifyOtpUsecase(sl()));

  sl.registerLazySingleton(() => RegisterUsecase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUsecase(repository: sl()));
  //Home

  sl.registerLazySingleton(() => GetFeedDetailUsecase(repo: sl()));
  sl.registerLazySingleton(() => GetProfileUsecase(profileRepo: sl()));

  //Repository (interface+Impl)
  sl.registerLazySingleton<AuthRepository>(() => RepositoryImpl(sl()));
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(sl()));
  sl.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton(() => AuthRemoteDatasource(sl()));
  sl.registerLazySingleton(() => HomeRemoteDatasource(sl()));
  sl.registerLazySingleton(() => ProfileRemoteDataSource(sl()));
}

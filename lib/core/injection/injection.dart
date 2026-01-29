import 'package:ecomerce_app/core/network/api_client.dart';
import 'package:ecomerce_app/feature/auth/data/datasource/auth_remote_datasource.dart';
import 'package:ecomerce_app/feature/auth/data/repositories/repository_Impl.dart';
import 'package:ecomerce_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:ecomerce_app/feature/auth/domain/usecase/login_usecase.dart';
import 'package:ecomerce_app/feature/auth/domain/usecase/register_usecase.dart';
import 'package:ecomerce_app/feature/auth/domain/usecase/reset_password_usecase.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/bloc.dart';
import 'package:ecomerce_app/feature/home/data/datasource/home_remote_datasource.dart';
import 'package:ecomerce_app/feature/home/data/repository_Impl/home_repo_Impl.dart';
import 'package:ecomerce_app/feature/home/domain/repository/home_repo.dart';
import 'package:ecomerce_app/feature/home/domain/usecase/get_banner_usecase.dart';
import 'package:ecomerce_app/feature/home/domain/usecase/get_best_seller.dart';
import 'package:ecomerce_app/feature/home/domain/usecase/get_feed_detail_usecase.dart';
import 'package:ecomerce_app/feature/home/domain/usecase/get_feed_usecase.dart';
import 'package:ecomerce_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(() => AuthBloc(sl(), sl(), sl()));
  sl.registerFactory(() => HomeBloc(sl(), sl(), sl(), sl()));
  sl.registerFactory(() => ApiClient());

  //UseCase
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => RegisterUsecase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUsecase(repository: sl()));
  //Home
  sl.registerLazySingleton(() => GetBannersUseCase(repo: sl()));
  sl.registerLazySingleton(() => GetFeedUsecase(repo: sl()));
  sl.registerLazySingleton(() => GetBestSellerUsecase(repo: sl()));
  sl.registerLazySingleton(() => GetFeedDetailUsecase(repo: sl()));

  //Repository (interface+Impl)
  sl.registerLazySingleton<AuthRepository>(() => RepositoryImpl(sl()));
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(sl()));

  sl.registerLazySingleton(() => AuthRemoteDatasource(sl()));
  sl.registerLazySingleton(() => HomeRemoteDatasource());
}

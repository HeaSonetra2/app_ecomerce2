import 'package:ecomerce_app/feature/home/domain/entities/banner.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<BannerPoster> banners;

  HomeLoaded({required this.banners});
}

class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}

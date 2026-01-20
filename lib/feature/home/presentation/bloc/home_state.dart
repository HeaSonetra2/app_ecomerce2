import 'package:ecomerce_app/feature/home/domain/entities/banner.dart';
import 'package:ecomerce_app/feature/home/domain/entities/feed.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<BannerPoster> banners;
  final List<Feed> feeds;

  HomeLoaded({required this.banners,required this.feeds});
}

class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}

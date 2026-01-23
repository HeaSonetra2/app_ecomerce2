import 'package:ecomerce_app/feature/home/domain/entities/banner.dart';
import 'package:ecomerce_app/feature/home/domain/entities/product.dart';
import 'package:ecomerce_app/feature/home/domain/entities/product_detail.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<BannerPoster> banners;
  final List<Product> feeds;
  final List<Product> bestSeller;

  HomeLoaded({
    required this.banners,
    required this.feeds,
    required this.bestSeller,
  });
}

class FeedDetailLoaded extends HomeState {
  final ProductDetail productDetail;

  FeedDetailLoaded({required this.productDetail});
}

class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}

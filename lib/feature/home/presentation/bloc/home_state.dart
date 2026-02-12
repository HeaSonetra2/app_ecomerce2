import 'package:ecomerce_app/feature/home/data/models/home_data_model.dart';
import 'package:ecomerce_app/feature/home/domain/entities/banner.dart';
import 'package:ecomerce_app/feature/home/domain/entities/product.dart';
import 'package:ecomerce_app/feature/home/domain/entities/product_detail.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeDataModel homeData;

  HomeLoaded({required this.homeData});

}

class FeedDetailLoaded extends HomeState {
  final ProductDetail productDetail;

  FeedDetailLoaded({required this.productDetail});
}

class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}


import 'package:ecomerce_app/feature/home/data/models/banner_model.dart';
import 'package:ecomerce_app/feature/home/data/models/product_model.dart';

class HomeDataModel {
  final List<BannerModel> banner;
  final List<ProductModel> feed;
  final List<ProductModel> bestSeller;

  HomeDataModel({
    required this.banner,
    required this.feed,
    required this.bestSeller,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) {
    return HomeDataModel(
      banner: (json['promotions'] as List)
          .map((item) => BannerModel.fromJson(item))
          .toList(),
      feed: (json['feed'] as List)
          .map((item) => ProductModel.fromJson(item))
          .toList(),
      bestSeller: (json['best_seller'] as List)
          .map((item) => ProductModel.fromJson(item))
          .toList(),
    );
  }

}
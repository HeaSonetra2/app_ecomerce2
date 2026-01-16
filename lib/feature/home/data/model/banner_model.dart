import 'package:ecomerce_app/feature/home/domain/entities/banner.dart';

class BannerModel extends BannerPoster {
  BannerModel({required super.id, required super.imageUrl});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(id: json['id'], imageUrl: json['imageUrl']);
  }
}

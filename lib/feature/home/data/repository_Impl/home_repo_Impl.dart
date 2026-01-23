import 'dart:convert';

import 'package:ecomerce_app/feature/home/data/model/banner_model.dart';
import 'package:ecomerce_app/feature/home/data/datasource/home_remote_datasource.dart';
import 'package:ecomerce_app/feature/home/data/model/best_seller.dart';
import 'package:ecomerce_app/feature/home/data/model/feed_detail_model.dart';
import 'package:ecomerce_app/feature/home/data/model/feed_model.dart';
import 'package:ecomerce_app/feature/home/domain/entities/banner.dart';
import 'package:ecomerce_app/feature/home/domain/entities/product.dart';
import 'package:ecomerce_app/feature/home/domain/entities/product_detail.dart';
import 'package:ecomerce_app/feature/home/domain/repository/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDatasource remoteDatasource;

  HomeRepoImpl(this.remoteDatasource);

  @override
  Future<List<BannerPoster>> getBanner() async {
    final jsonList = await remoteDatasource.getBanner();
    return jsonList.map((json) => BannerModel.fromJson(json)).toList();
  }

  @override
  Future<List<Product>> getFeed() async {
    final jsonList = await remoteDatasource.getFeed();
    return jsonList.map((json) => FeedModel.fromJson(json)).toList();
  }

  @override
  Future<List<Product>> getBestSeller() async {
    final jsonList = await remoteDatasource.getBestSeller();
    return jsonList.map((json) => BestSellerModel.fromJson(json)).toList();
  }

  @override
  Future<ProductDetail> getFeedDetail(String Id) async {
    final data = await remoteDatasource.getFeedDetail(Id);
    return FeedDetailModel.fromJson(data, Id);
  }
}

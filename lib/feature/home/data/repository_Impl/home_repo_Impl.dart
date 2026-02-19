import 'dart:convert';

import 'package:ecomerce_app/feature/home/data/datasource/home_remote_datasource.dart';
import 'package:ecomerce_app/feature/home/data/model/product_detail_model.dart';
import 'package:ecomerce_app/feature/home/data/models/home_data_model.dart';
import 'package:ecomerce_app/feature/home/domain/entities/banner.dart';
import 'package:ecomerce_app/feature/home/domain/entities/product.dart';
import 'package:ecomerce_app/feature/home/domain/entities/product_detail.dart';
import 'package:ecomerce_app/feature/home/domain/repository/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDatasource remoteDatasource;

  HomeRepoImpl(this.remoteDatasource);

  @override
  Future<List<Product>> getFeed() {
    // TODO: implement getFeed
    throw UnimplementedError();
  }

  @override
  Future<ProductDetail> getFeedDetail(int Id) {
    final data = remoteDatasource.getFeedDetail(Id.toString());
    return data.then((respone) {
      final inner = respone['data'];
      return FeedDetailModel.fromJson(inner, Id.toString());
    });
  }

  @override
  Future<HomeDataModel> getHome() {
    final data = remoteDatasource.getHome();
    return data.then((respone) {
      // remoteDatasource returns the full response object (with keys like
      // 'success', 'message', 'data'). The model expects the inner 'data'
      // map, so pass that if available.
      final inner =
          respone is Map<String, dynamic> && respone.containsKey('data')
          ? respone['data']
          : respone;
      return HomeDataModel.fromJson(inner as Map<String, dynamic>);
    });
  }
}

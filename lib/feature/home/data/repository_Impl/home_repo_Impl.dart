import 'dart:convert';

import 'package:ecomerce_app/feature/home/data/datasource/home_remote_datasource.dart';
import 'package:ecomerce_app/feature/home/data/model/feed_detail_model.dart';
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
  Future<ProductDetail> getFeedDetail(String Id) {
    // TODO: implement getFeedDetail
    throw UnimplementedError();
  }

  @override
  Future<HomeDataModel> getHome() {
    final data=remoteDatasource.getHome();
    return data.then((respone) => HomeDataModel.fromJson(respone));
  }
}









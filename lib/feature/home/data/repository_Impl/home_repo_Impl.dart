import 'dart:convert';

import 'package:ecomerce_app/feature/home/data/model/banner_model.dart';
import 'package:ecomerce_app/feature/home/data/remote_datasource/home_remote_datasource.dart';
import 'package:ecomerce_app/feature/home/domain/entities/banner.dart';
import 'package:ecomerce_app/feature/home/domain/repository/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDatasource remoteDatasource;

  HomeRepoImpl( this.remoteDatasource);

  @override
  Future<List<BannerPoster>> getBanner() async {
    final jsonList = await remoteDatasource.getBanner();
    return jsonList.map((json) => BannerModel.fromJson(json)).toList();
  }
}

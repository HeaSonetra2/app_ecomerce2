import 'package:ecomerce_app/feature/home/domain/entities/banner.dart';
import 'package:ecomerce_app/feature/home/domain/entities/product.dart';
import 'package:ecomerce_app/feature/home/domain/entities/product_detail.dart';

abstract class HomeRepo {
  Future<List<BannerPoster>> getBanner();
  Future<List<Product>> getFeed();
  Future<List<Product>> getBestSeller();
  Future<ProductDetail> getFeedDetail(String Id);
}

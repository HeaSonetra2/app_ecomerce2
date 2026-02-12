import 'package:ecomerce_app/feature/home/data/models/home_data_model.dart';
import 'package:ecomerce_app/feature/home/domain/entities/product_detail.dart';

abstract class HomeRepo {
  // Future<List<BannerPoster>> getBanner();
  // Future<List<Product>> getFeed();
  // Future<List<Product>> getBestSeller();
  Future<HomeDataModel> getHome();
  
  Future<ProductDetail> getFeedDetail(String Id);
}

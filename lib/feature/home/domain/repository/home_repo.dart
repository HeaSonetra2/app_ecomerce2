import 'package:ecomerce_app/feature/home/domain/entities/banner.dart';

abstract class HomeRepo {
  Future<List<BannerPoster>> getBanner();
}

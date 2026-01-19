import 'package:ecomerce_app/feature/home/domain/entities/banner.dart';
import 'package:ecomerce_app/feature/home/domain/entities/feed.dart';

abstract class HomeRepo {
  Future<List<BannerPoster>> getBanner();
  Future<List<Feed>> getFeed();
}

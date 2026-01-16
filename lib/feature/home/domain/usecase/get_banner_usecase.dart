import 'package:ecomerce_app/feature/home/domain/entities/banner.dart';
import 'package:ecomerce_app/feature/home/domain/repository/home_repo.dart';

class GetBannersUseCase {
  final HomeRepo repo;

  GetBannersUseCase({required this.repo});

  Future<List<BannerPoster>> call() {
    return repo.getBanner();
  }
}

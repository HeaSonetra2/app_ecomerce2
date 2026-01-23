import 'package:ecomerce_app/feature/home/domain/entities/product.dart';
import 'package:ecomerce_app/feature/home/domain/repository/home_repo.dart';

class GetBestSellerUsecase {
  final HomeRepo repo;

  GetBestSellerUsecase({required this.repo});

  Future<List<Product>> call() {
    return repo.getBestSeller();
  }
}

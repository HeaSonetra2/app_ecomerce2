import 'package:ecomerce_app/feature/home/domain/entities/product_detail.dart';
import 'package:ecomerce_app/feature/home/domain/repository/home_repo.dart';

class GetFeedDetailUsecase {
  final HomeRepo repo;

  GetFeedDetailUsecase({required this.repo});

  Future<ProductDetail> call(int Id) {
    return repo.getFeedDetail(Id);
  }
}

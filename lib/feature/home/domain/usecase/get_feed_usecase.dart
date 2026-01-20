import 'package:ecomerce_app/feature/home/domain/entities/feed.dart';
import 'package:ecomerce_app/feature/home/domain/repository/home_repo.dart';

class GetFeedUsecase {
  final HomeRepo repo;

  GetFeedUsecase({required this.repo});

  Future<List<Feed>> call() {
    return repo.getFeed();
  }
}

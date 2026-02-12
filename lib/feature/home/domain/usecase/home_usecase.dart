

import 'package:ecomerce_app/feature/home/data/models/home_data_model.dart';
import 'package:ecomerce_app/feature/home/domain/repository/home_repo.dart';

class HomeUsecase {
  final HomeRepo homeRepo;
  
  HomeUsecase({required this.homeRepo});

  Future<HomeDataModel> call() {
    return homeRepo.getHome();
  }
}
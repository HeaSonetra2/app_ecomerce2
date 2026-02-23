

import 'package:ecomerce_app/feature/order/data/model/cart_model.dart';
import 'package:ecomerce_app/feature/order/domain/repository/cart_repo.dart';

class GetCartUseCase {
  final CartRepo cartRepo;
  GetCartUseCase(this.cartRepo);

  Future<CartModel> call() {
    return cartRepo.getCartDetail();
  }
}
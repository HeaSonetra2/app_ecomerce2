

import 'package:ecomerce_app/feature/order/data/model/cart_model.dart';
import 'package:ecomerce_app/feature/order/domain/repository/cart_repo.dart';

class UpdateQtyCartUseCase {
  final CartRepo cartRepo;

  UpdateQtyCartUseCase(this.cartRepo);

  Future<CartModel> call(int productId, int quantity) async {
    return await cartRepo.updateQtyCart(productId, quantity);
  }
}
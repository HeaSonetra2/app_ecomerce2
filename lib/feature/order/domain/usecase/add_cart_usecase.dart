

import 'package:ecomerce_app/feature/order/data/model/cart_model.dart';
import 'package:ecomerce_app/feature/order/domain/repository/cart_repo.dart';

class AddCartUseCase {
  final CartRepo cartRepo;

  AddCartUseCase(this.cartRepo);

  Future<CartModel> call(int productId, int quantity) async {
    return await cartRepo.addToCart(productId, quantity);
  }
}

import 'package:ecomerce_app/feature/order/data/model/cart_model.dart';

abstract class CartRepo {
  Future<CartModel> getCartDetail();
}
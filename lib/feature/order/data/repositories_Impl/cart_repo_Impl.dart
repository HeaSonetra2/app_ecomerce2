import 'package:ecomerce_app/feature/order/data/datasource/cart_remote_datasource.dart';
import 'package:ecomerce_app/feature/order/data/model/cart_model.dart';
import 'package:ecomerce_app/feature/order/domain/repository/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final CartRemoteDatasource cartRemoteDatasource;

  CartRepoImpl(this.cartRemoteDatasource);

  @override
  Future<CartModel> addToCart(int productId, int quantity) async {
    final data = await cartRemoteDatasource.addCart(productId, quantity);
    return CartModel.fromJson(data);
  }

  @override
  Future<CartModel> getCartDetail() async {
    final data = await cartRemoteDatasource.getCartDetail();
    return CartModel.fromJson(data);
  }
  @override
  Future<CartModel> updateQtyCart(int productId, int quantity) async {
    final data = await cartRemoteDatasource.updateQtyCart(productId, quantity);
    return CartModel.fromJson(data);
  }
}

import 'package:ecomerce_app/feature/order/data/datasource/cart_remote_datasource.dart';
import 'package:ecomerce_app/feature/order/data/model/cart_model.dart';
import 'package:ecomerce_app/feature/order/domain/repository/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final CartRemoteDatasource cartRemoteDatasource;

  CartRepoImpl(this.cartRemoteDatasource);

  @override
  Future<CartModel> getCartDetail() async {
    final data = await cartRemoteDatasource.getCartDetail();
    return CartModel.fromJson(data);
  }
}

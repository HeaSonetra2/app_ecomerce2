

import 'package:ecomerce_app/feature/order/data/model/cart_item_model.dart';

class CartModel {
  final double cartTotal;
  final double deliveryFee;
  final double tax;
  final List<CartItemModel> items;

  CartModel({
    required this.cartTotal,
    required this.deliveryFee,
    required this.tax,
    required this.items,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      cartTotal: json['cartTotal'],
      deliveryFee: json['deliveryFee'],
      tax: json['tax'],
      items: (json['items'] as List)
          .map((item) => CartItemModel.fromJson(item))
          .toList(),
    );
  }
}

 


import 'package:ecomerce_app/feature/order/data/model/cart_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final CartModel cartDetail;

  CartLoaded({required this.cartDetail});
}

class CartError extends CartState {
  final String message;

  CartError({required this.message});
}

class CartItemAdded extends CartState {
  final String message;

  CartItemAdded({required this.message});
}
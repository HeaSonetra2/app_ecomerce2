

abstract class CartEvent {}

class GetCartDetailEvent extends CartEvent {}

class UpdateCartQtyEvent extends CartEvent {
  final int productId;
  final int quantity;

  UpdateCartQtyEvent({required this.productId, required this.quantity});
}

class AddCartEvent extends CartEvent {
  final int productId;
  final int quantity;

  AddCartEvent({required this.productId, required this.quantity});
}
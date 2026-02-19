

class CartItemModel {
  final String id;
  final String name;
  final double price;
  final int quantity;

  CartItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }
}
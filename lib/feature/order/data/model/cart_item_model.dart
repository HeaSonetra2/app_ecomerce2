

class CartItemModel {
  final int id;
  final String name;
  final int quantity;
  final double price;
  final double subtotal;
  final bool inStock;


  CartItemModel({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.subtotal,
    required this.inStock,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['productId'] ,
      name: json['name'] ?? 'Unknown Product',
      quantity: json['quantity'] ?? 0,
      price: json['unitPrice'] ?? 0.0,
      subtotal: json['subtotal'] ?? 0.0,
      inStock: json['inStock'] ?? false,
    );
  }
}

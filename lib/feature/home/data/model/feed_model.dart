import 'package:ecomerce_app/feature/home/domain/entities/product.dart';

class FeedModel extends Product {
  FeedModel({
    required super.id,
    required super.name,
    required super.qty,
    required super.type,
    required super.price,
    required super.imageUrl,
  });

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      id: json['id'],
      name: json['name'],
      qty: json['qty'],
      type: json['type'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }
}

import 'package:ecomerce_app/feature/home/domain/entities/product.dart';

class BestSellerModel extends Product {
  BestSellerModel({
    required super.id,
    required super.name,
    required super.qty,
    required super.type,
    required super.price,
    required super.imageUrl,
  });

  factory BestSellerModel.fromJson(Map<String, dynamic> json) {
    return BestSellerModel(
      id: json['id'],
      name: json['name'],
      qty: json['qty'],
      type: json['type'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }
}

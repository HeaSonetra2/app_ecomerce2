import 'package:ecomerce_app/feature/home/domain/entities/product_detail.dart';

class FeedDetailModel extends ProductDetail {
  FeedDetailModel({
    required super.id,
    required super.name,
    required super.qty,
    required super.type,
    required super.price,
    required super.desc,
    required super.isFav,
    required super.nutrition,
    required super.review,
    required super.imageUrl,
  });

  factory FeedDetailModel.fromJson(Map<String, dynamic> json, String Id) {
    return FeedDetailModel(
      id: json['id'] ?? int.parse(Id),
      name: json['name'] ?? '',
      qty: json['qty'] ?? 0,
      type: json['type'] ?? '',
      price: json['price'] ?? 0.0,
      desc: json['desc'] ?? '',
      isFav: json['isFav'] ?? false,
      nutrition: json['nutrition'] ?? 0.0,
      review: json['review'] ?? 0.0,
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}

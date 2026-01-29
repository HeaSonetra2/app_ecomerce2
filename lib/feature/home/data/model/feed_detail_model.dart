import 'package:ecomerce_app/feature/home/domain/entities/product_detail.dart';

class FeedDetailModel extends ProductDetail {
  FeedDetailModel({
    required super.id,
    required super.name,
    required super.qty,
    required super.stockQty,
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
      id: json['id'],
      name: json['name'],
      qty: json['qty'],
      stockQty: json['stock_qty'],
      type: json['type'],
      price: json['price'],
      desc: json['desc'],
      isFav: json['isFav'],
      nutrition: json['nutrition'],
      review: json['review'],
      imageUrl: json['imageUrl'],
    );
  }
}

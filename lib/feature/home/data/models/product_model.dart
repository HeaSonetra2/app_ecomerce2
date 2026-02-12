
class ProductModel {
  final String id;
  final String name;
  final int qty;
  final String type;
  final double price;
  final String desc;
  final bool isFav;
  final double nutrition;
  final double review;
  final String imageUrl;
  ProductModel({
    required this.id,
    required this.name,
    required this.qty,
    required this.type,
    required this.price,
    required this.desc,
    required this.isFav,
    required this.nutrition,
    required this.review,
    required this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      qty: json['qty'] as int,
      type: json['type'] as String,
      price: (json['price'] as num).toDouble(),
      desc: json['desc'] as String,
      isFav: json['fav'] as bool,
      nutrition: (json['nutrition'] as num).toDouble(),
      review: (json['review'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
    );
  }
}
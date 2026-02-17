class ProductModel {
  final int id;
  final String? name;
  final int qty;
  final String? type;
  final double price;
  final String? desc;
  final bool isFav;
  final double nutrition;
  final double review;
  final String? imageUrl;
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
      id: json['id'] ?? 0,
      name: json['name']?.toString() ?? '',
      qty: json['qty'] ?? 0,
      type: json['type']?.toString() ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      desc: json['desc']?.toString() ?? '',
      isFav: json['fav'] ?? false,
      nutrition: (json['nutrition'] as num?)?.toDouble() ?? 0.0,
      review: (json['review'] as num?)?.toDouble() ?? 0.0,
      imageUrl: json['imageUrl']?.toString() ?? '',
    );
  }
}

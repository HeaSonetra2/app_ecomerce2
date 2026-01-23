class ProductDetail {
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

  ProductDetail({
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
}

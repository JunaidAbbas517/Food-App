class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String mealReview;
  final String imageUrl;
  bool isFavorite;

  ProductModel({
    required this.id,
    required this.mealReview,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false,
  });
}

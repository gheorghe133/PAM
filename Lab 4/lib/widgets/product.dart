/// Product model for UI widgets
/// This is a simple data class used by widgets
/// It's separate from domain entities to keep widgets independent
class Product {
  final String id;
  final String imagePath;
  final String? saleLabel;
  final double rating;
  final int reviewCount;
  final String brandName;
  final String itemName;
  final double oldPrice;
  final double newPrice;
  final bool isNew;
  final bool isFavorite;

  const Product({
    required this.id,
    required this.imagePath,
    this.saleLabel,
    required this.rating,
    required this.reviewCount,
    required this.brandName,
    required this.itemName,
    required this.oldPrice,
    required this.newPrice,
    this.isNew = false,
    this.isFavorite = false,
  });

  bool get isOnSale => saleLabel != null && saleLabel!.isNotEmpty;

  String get formattedOldPrice => '\$${oldPrice.toStringAsFixed(2)}';
  String get formattedNewPrice => '\$${newPrice.toStringAsFixed(2)}';

  Product copyWith({
    String? id,
    String? imagePath,
    String? saleLabel,
    double? rating,
    int? reviewCount,
    String? brandName,
    String? itemName,
    double? oldPrice,
    double? newPrice,
    bool? isNew,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      imagePath: imagePath ?? this.imagePath,
      saleLabel: saleLabel ?? this.saleLabel,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      brandName: brandName ?? this.brandName,
      itemName: itemName ?? this.itemName,
      oldPrice: oldPrice ?? this.oldPrice,
      newPrice: newPrice ?? this.newPrice,
      isNew: isNew ?? this.isNew,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

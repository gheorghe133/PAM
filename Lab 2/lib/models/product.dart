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

  // Helper getters
  bool get isOnSale => saleLabel != null && saleLabel!.isNotEmpty;
  
  String get formattedOldPrice => '\$${oldPrice.toStringAsFixed(0)}';
  
  String get formattedNewPrice => '\$${newPrice.toStringAsFixed(0)}';
  
  double get discountPercentage {
    if (oldPrice <= 0) return 0;
    return ((oldPrice - newPrice) / oldPrice * 100);
  }

  // Copy with method for state updates
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

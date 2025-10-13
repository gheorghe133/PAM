import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  final String id;
  final String imagePath;
  final List<String>? detailImages;
  final String? saleLabel;
  final double rating;
  final int reviewCount;
  final String brandName;
  final String itemName;
  final double oldPrice;
  final double newPrice;
  final bool isNew;
  final bool isFavorite;
  final String? description;
  final String? detailTitle;
  final String? detailBrand;
  final String? detailPrice;

  const Product({
    required this.id,
    required this.imagePath,
    this.detailImages,
    this.saleLabel,
    required this.rating,
    required this.reviewCount,
    required this.brandName,
    required this.itemName,
    required this.oldPrice,
    required this.newPrice,
    this.isNew = false,
    this.isFavorite = false,
    this.description,
    this.detailTitle,
    this.detailBrand,
    this.detailPrice,
  });

  // Helper getters
  bool get isOnSale => saleLabel != null && saleLabel!.isNotEmpty;

  String get formattedOldPrice => '${oldPrice.toStringAsFixed(0)}\$';

  String get formattedNewPrice => '${newPrice.toStringAsFixed(0)}\$';

  // Copy with method for state updates
  Product copyWith({
    String? id,
    String? imagePath,
    List<String>? detailImages,
    String? saleLabel,
    double? rating,
    int? reviewCount,
    String? brandName,
    String? itemName,
    double? oldPrice,
    double? newPrice,
    bool? isNew,
    bool? isFavorite,
    String? description,
    String? detailTitle,
    String? detailBrand,
    String? detailPrice,
  }) {
    return Product(
      id: id ?? this.id,
      imagePath: imagePath ?? this.imagePath,
      detailImages: detailImages ?? this.detailImages,
      saleLabel: saleLabel ?? this.saleLabel,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      brandName: brandName ?? this.brandName,
      itemName: itemName ?? this.itemName,
      oldPrice: oldPrice ?? this.oldPrice,
      newPrice: newPrice ?? this.newPrice,
      isNew: isNew ?? this.isNew,
      isFavorite: isFavorite ?? this.isFavorite,
      description: description ?? this.description,
      detailTitle: detailTitle ?? this.detailTitle,
      detailBrand: detailBrand ?? this.detailBrand,
      detailPrice: detailPrice ?? this.detailPrice,
    );
  }

  // JSON serialization
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  // Equatable props for state comparison
  @override
  List<Object?> get props => [
    id,
    imagePath,
    detailImages,
    saleLabel,
    rating,
    reviewCount,
    brandName,
    itemName,
    oldPrice,
    newPrice,
    isNew,
    isFavorite,
    description,
    detailTitle,
    detailBrand,
    detailPrice,
  ];
}

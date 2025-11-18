import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/feed_item.dart';
import '../../core/constants.dart';

part 'feed_item_model.g.dart';

/// Data model for feed item with JSON serialization
@JsonSerializable(explicitToJson: true)
class FeedItemModel {
  final int id;
  final String brand;
  final String name;
  final String image;
  final double? price;
  final double? oldPrice;
  final double? newPrice;
  final int? discount;
  final double rating;
  final int reviews;
  final bool isFavorite;
  final bool? isNew;

  const FeedItemModel({
    required this.id,
    required this.brand,
    required this.name,
    required this.image,
    this.price,
    this.oldPrice,
    this.newPrice,
    this.discount,
    required this.rating,
    required this.reviews,
    this.isFavorite = false,
    this.isNew,
  });

  factory FeedItemModel.fromJson(Map<String, dynamic> json) {
    // Use fallback image if the image field is missing or empty
    final imageUrl = json['image'] as String?;
    final finalImage = (imageUrl == null || imageUrl.isEmpty)
        ? AppConstants.fallbackImageUrl
        : imageUrl;

    return FeedItemModel(
      id: (json['id'] as num).toInt(),
      brand: json['brand'] as String,
      name: json['name'] as String,
      image: finalImage,
      price: (json['price'] as num?)?.toDouble(),
      oldPrice: (json['oldPrice'] as num?)?.toDouble(),
      newPrice: (json['newPrice'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toInt(),
      rating: (json['rating'] as num).toDouble(),
      reviews: (json['reviews'] as num).toInt(),
      isFavorite: json['isFavorite'] as bool? ?? false,
      isNew: json['isNew'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => _$FeedItemModelToJson(this);

  /// Convert data model to domain entity
  FeedItem toEntity() {
    return FeedItem(
      id: id,
      brand: brand,
      name: name,
      image: image,
      price: newPrice ?? price ?? 0.0,
      oldPrice: oldPrice,
      discount: discount,
      rating: rating,
      reviews: reviews,
      isFavorite: isFavorite,
      isNew: isNew ?? false,
    );
  }
}

import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/product_detail.dart';
import '../../core/constants.dart';

part 'product_detail_model.g.dart';

@JsonSerializable()
class ProductColorModel {
  final String name;
  final String hex;
  final List<String> images;

  const ProductColorModel({
    required this.name,
    required this.hex,
    required this.images,
  });

  factory ProductColorModel.fromJson(Map<String, dynamic> json) {
    // Handle missing or empty images by providing fallback
    final imagesList = (json['images'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [];

    // If images list is empty, add fallback image
    final finalImages =
        imagesList.isEmpty ? [AppConstants.fallbackImageUrl] : imagesList;

    return ProductColorModel(
      name: json['name'] as String,
      hex: json['hex'] as String,
      images: finalImages,
    );
  }

  Map<String, dynamic> toJson() => _$ProductColorModelToJson(this);

  ProductColor toEntity() {
    return ProductColor(
      name: name,
      hex: hex,
      images: images,
    );
  }
}

@JsonSerializable()
class ShippingInfoModel {
  final String delivery;
  final String returns;

  const ShippingInfoModel({
    required this.delivery,
    required this.returns,
  });

  factory ShippingInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingInfoModelToJson(this);

  ShippingInfo toEntity() {
    return ShippingInfo(
      delivery: delivery,
      returns: returns,
    );
  }
}

@JsonSerializable()
class SupportInfoModel {
  final String contactEmail;
  final String faqUrl;

  const SupportInfoModel({
    required this.contactEmail,
    required this.faqUrl,
  });

  factory SupportInfoModel.fromJson(Map<String, dynamic> json) =>
      _$SupportInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$SupportInfoModelToJson(this);

  SupportInfo toEntity() {
    return SupportInfo(
      contactEmail: contactEmail,
      faqUrl: faqUrl,
    );
  }
}

@JsonSerializable()
class ProductActionsModel {
  final bool addToCart;
  final bool addToWishlist;
  final bool share;

  const ProductActionsModel({
    required this.addToCart,
    required this.addToWishlist,
    required this.share,
  });

  factory ProductActionsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductActionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductActionsModelToJson(this);

  ProductActions toEntity() {
    return ProductActions(
      addToCart: addToCart,
      addToWishlist: addToWishlist,
      share: share,
    );
  }
}

@JsonSerializable()
class RelatedProductModel {
  final String id;
  final String title;
  final String brand;
  final double price;
  final double? oldPrice;
  final String currency;
  final String? discount;
  final double rating;
  final int reviewsCount;
  final String image;

  const RelatedProductModel({
    required this.id,
    required this.title,
    required this.brand,
    required this.price,
    this.oldPrice,
    required this.currency,
    this.discount,
    required this.rating,
    required this.reviewsCount,
    required this.image,
  });

  factory RelatedProductModel.fromJson(Map<String, dynamic> json) {
    // Use fallback image if the image field is missing or empty
    final imageUrl = json['image'] as String?;
    final finalImage = (imageUrl == null || imageUrl.isEmpty)
        ? AppConstants.fallbackImageUrl
        : imageUrl;

    return RelatedProductModel(
      id: json['id'] as String,
      title: json['title'] as String,
      brand: json['brand'] as String,
      price: (json['price'] as num).toDouble(),
      oldPrice: (json['oldPrice'] as num?)?.toDouble(),
      currency: json['currency'] as String,
      discount: json['discount'] as String?,
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: (json['reviewsCount'] as num).toInt(),
      image: finalImage,
    );
  }

  Map<String, dynamic> toJson() => _$RelatedProductModelToJson(this);

  RelatedProduct toEntity() {
    return RelatedProduct(
      id: id,
      title: title,
      brand: brand,
      price: price,
      oldPrice: oldPrice,
      currency: currency,
      discount: discount,
      rating: rating,
      reviewsCount: reviewsCount,
      image: image,
    );
  }
}

@JsonSerializable()
class ProductDetailModel {
  final String id;
  final String title;
  final String brand;
  final String description;
  final double price;
  final String currency;
  final double rating;
  final int reviewsCount;
  final List<ProductColorModel> colors;
  final List<String> sizes;
  final ShippingInfoModel shippingInfo;
  final SupportInfoModel support;
  final ProductActionsModel actions;

  const ProductDetailModel({
    required this.id,
    required this.title,
    required this.brand,
    required this.description,
    required this.price,
    required this.currency,
    required this.rating,
    required this.reviewsCount,
    required this.colors,
    required this.sizes,
    required this.shippingInfo,
    required this.support,
    required this.actions,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailModelToJson(this);

  ProductDetail toEntity(List<RelatedProduct> relatedProducts) {
    return ProductDetail(
      id: id,
      title: title,
      brand: brand,
      description: description,
      price: price,
      currency: currency,
      rating: rating,
      reviewsCount: reviewsCount,
      colors: colors.map((c) => c.toEntity()).toList(),
      sizes: sizes,
      shippingInfo: shippingInfo.toEntity(),
      support: support.toEntity(),
      actions: actions.toEntity(),
      relatedProducts: relatedProducts,
    );
  }
}

@JsonSerializable()
class ProductDetailResponseModel {
  final ProductDetailModel product;
  final List<RelatedProductModel> relatedProducts;

  const ProductDetailResponseModel({
    required this.product,
    required this.relatedProducts,
  });

  factory ProductDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailResponseModelToJson(this);
}

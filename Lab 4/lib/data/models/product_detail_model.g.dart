// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: unused_element
ProductColorModel _$ProductColorModelFromJson(Map<String, dynamic> json) =>
    ProductColorModel(
      name: json['name'] as String,
      hex: json['hex'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProductColorModelToJson(ProductColorModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'hex': instance.hex,
      'images': instance.images,
    };

ShippingInfoModel _$ShippingInfoModelFromJson(Map<String, dynamic> json) =>
    ShippingInfoModel(
      delivery: json['delivery'] as String,
      returns: json['returns'] as String,
    );

Map<String, dynamic> _$ShippingInfoModelToJson(ShippingInfoModel instance) =>
    <String, dynamic>{
      'delivery': instance.delivery,
      'returns': instance.returns,
    };

SupportInfoModel _$SupportInfoModelFromJson(Map<String, dynamic> json) =>
    SupportInfoModel(
      contactEmail: json['contactEmail'] as String,
      faqUrl: json['faqUrl'] as String,
    );

Map<String, dynamic> _$SupportInfoModelToJson(SupportInfoModel instance) =>
    <String, dynamic>{
      'contactEmail': instance.contactEmail,
      'faqUrl': instance.faqUrl,
    };

ProductActionsModel _$ProductActionsModelFromJson(Map<String, dynamic> json) =>
    ProductActionsModel(
      addToCart: json['addToCart'] as bool,
      addToWishlist: json['addToWishlist'] as bool,
      share: json['share'] as bool,
    );

Map<String, dynamic> _$ProductActionsModelToJson(
  ProductActionsModel instance,
) => <String, dynamic>{
  'addToCart': instance.addToCart,
  'addToWishlist': instance.addToWishlist,
  'share': instance.share,
};

// ignore: unused_element
RelatedProductModel _$RelatedProductModelFromJson(Map<String, dynamic> json) =>
    RelatedProductModel(
      id: json['id'] as String,
      title: json['title'] as String,
      brand: json['brand'] as String,
      price: (json['price'] as num).toDouble(),
      oldPrice: (json['oldPrice'] as num?)?.toDouble(),
      currency: json['currency'] as String,
      discount: json['discount'] as String?,
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: (json['reviewsCount'] as num).toInt(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$RelatedProductModelToJson(
  RelatedProductModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'brand': instance.brand,
  'price': instance.price,
  'oldPrice': instance.oldPrice,
  'currency': instance.currency,
  'discount': instance.discount,
  'rating': instance.rating,
  'reviewsCount': instance.reviewsCount,
  'image': instance.image,
};

ProductDetailModel _$ProductDetailModelFromJson(Map<String, dynamic> json) =>
    ProductDetailModel(
      id: json['id'] as String,
      title: json['title'] as String,
      brand: json['brand'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: (json['reviewsCount'] as num).toInt(),
      colors: (json['colors'] as List<dynamic>)
          .map((e) => ProductColorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sizes: (json['sizes'] as List<dynamic>).map((e) => e as String).toList(),
      shippingInfo: ShippingInfoModel.fromJson(
        json['shippingInfo'] as Map<String, dynamic>,
      ),
      support: SupportInfoModel.fromJson(
        json['support'] as Map<String, dynamic>,
      ),
      actions: ProductActionsModel.fromJson(
        json['actions'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ProductDetailModelToJson(ProductDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'brand': instance.brand,
      'description': instance.description,
      'price': instance.price,
      'currency': instance.currency,
      'rating': instance.rating,
      'reviewsCount': instance.reviewsCount,
      'colors': instance.colors,
      'sizes': instance.sizes,
      'shippingInfo': instance.shippingInfo,
      'support': instance.support,
      'actions': instance.actions,
    };

ProductDetailResponseModel _$ProductDetailResponseModelFromJson(
  Map<String, dynamic> json,
) => ProductDetailResponseModel(
  product: ProductDetailModel.fromJson(json['product'] as Map<String, dynamic>),
  relatedProducts: (json['relatedProducts'] as List<dynamic>)
      .map((e) => RelatedProductModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProductDetailResponseModelToJson(
  ProductDetailResponseModel instance,
) => <String, dynamic>{
  'product': instance.product,
  'relatedProducts': instance.relatedProducts,
};

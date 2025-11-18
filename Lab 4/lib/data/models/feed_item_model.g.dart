// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: unused_element
FeedItemModel _$FeedItemModelFromJson(Map<String, dynamic> json) =>
    FeedItemModel(
      id: (json['id'] as num).toInt(),
      brand: json['brand'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      price: (json['price'] as num?)?.toDouble(),
      oldPrice: (json['oldPrice'] as num?)?.toDouble(),
      newPrice: (json['newPrice'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toInt(),
      rating: (json['rating'] as num).toDouble(),
      reviews: (json['reviews'] as num).toInt(),
      isFavorite: json['isFavorite'] as bool? ?? false,
      isNew: json['isNew'] as bool?,
    );

Map<String, dynamic> _$FeedItemModelToJson(FeedItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'oldPrice': instance.oldPrice,
      'newPrice': instance.newPrice,
      'discount': instance.discount,
      'rating': instance.rating,
      'reviews': instance.reviews,
      'isFavorite': instance.isFavorite,
      'isNew': instance.isNew,
    };

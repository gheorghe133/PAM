// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: json['id'] as String,
  imagePath: json['imagePath'] as String,
  saleLabel: json['saleLabel'] as String?,
  rating: (json['rating'] as num).toDouble(),
  reviewCount: (json['reviewCount'] as num).toInt(),
  brandName: json['brandName'] as String,
  itemName: json['itemName'] as String,
  oldPrice: (json['oldPrice'] as num).toDouble(),
  newPrice: (json['newPrice'] as num).toDouble(),
  isNew: json['isNew'] as bool? ?? false,
  isFavorite: json['isFavorite'] as bool? ?? false,
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'imagePath': instance.imagePath,
  'saleLabel': instance.saleLabel,
  'rating': instance.rating,
  'reviewCount': instance.reviewCount,
  'brandName': instance.brandName,
  'itemName': instance.itemName,
  'oldPrice': instance.oldPrice,
  'newPrice': instance.newPrice,
  'isNew': instance.isNew,
  'isFavorite': instance.isFavorite,
};

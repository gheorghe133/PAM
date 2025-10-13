// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: json['id'] as String,
  imagePath: json['imagePath'] as String,
  detailImages: (json['detailImages'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  saleLabel: json['saleLabel'] as String?,
  rating: (json['rating'] as num).toDouble(),
  reviewCount: (json['reviewCount'] as num).toInt(),
  brandName: json['brandName'] as String,
  itemName: json['itemName'] as String,
  oldPrice: (json['oldPrice'] as num).toDouble(),
  newPrice: (json['newPrice'] as num).toDouble(),
  isNew: json['isNew'] as bool? ?? false,
  isFavorite: json['isFavorite'] as bool? ?? false,
  description: json['description'] as String?,
  detailTitle: json['detailTitle'] as String?,
  detailBrand: json['detailBrand'] as String?,
  detailPrice: json['detailPrice'] as String?,
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'imagePath': instance.imagePath,
  'detailImages': instance.detailImages,
  'saleLabel': instance.saleLabel,
  'rating': instance.rating,
  'reviewCount': instance.reviewCount,
  'brandName': instance.brandName,
  'itemName': instance.itemName,
  'oldPrice': instance.oldPrice,
  'newPrice': instance.newPrice,
  'isNew': instance.isNew,
  'isFavorite': instance.isFavorite,
  'description': instance.description,
  'detailTitle': instance.detailTitle,
  'detailBrand': instance.detailBrand,
  'detailPrice': instance.detailPrice,
};

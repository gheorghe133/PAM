// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_section_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedSectionModel _$FeedSectionModelFromJson(Map<String, dynamic> json) =>
    FeedSectionModel(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => FeedItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedSectionModelToJson(FeedSectionModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'items': instance.items,
    };

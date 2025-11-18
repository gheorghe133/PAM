// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedResponseModel _$FeedResponseModelFromJson(Map<String, dynamic> json) =>
    FeedResponseModel(
      header: FeedHeaderModel.fromJson(json['header'] as Map<String, dynamic>),
      sections: (json['sections'] as List<dynamic>)
          .map((e) => FeedSectionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedResponseModelToJson(FeedResponseModel instance) =>
    <String, dynamic>{'header': instance.header, 'sections': instance.sections};

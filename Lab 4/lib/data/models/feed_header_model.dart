import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/feed_header.dart';

part 'feed_header_model.g.dart';

/// Data model for feed header with JSON serialization
@JsonSerializable()
class FeedHeaderModel {
  final String title;
  final String bannerImage;

  const FeedHeaderModel({
    required this.title,
    required this.bannerImage,
  });

  factory FeedHeaderModel.fromJson(Map<String, dynamic> json) =>
      _$FeedHeaderModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedHeaderModelToJson(this);

  /// Convert data model to domain entity
  FeedHeader toEntity() {
    return FeedHeader(
      title: title,
      bannerImage: bannerImage,
    );
  }
}


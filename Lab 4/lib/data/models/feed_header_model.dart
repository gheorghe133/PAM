import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/feed_header.dart';

part 'feed_header_model.g.dart';

@JsonSerializable()
class FeedHeaderModel {
  final String title;
  final String bannerImage;

  const FeedHeaderModel({required this.title, required this.bannerImage});

  factory FeedHeaderModel.fromJson(Map<String, dynamic> json) =>
      _$FeedHeaderModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedHeaderModelToJson(this);

  FeedHeader toEntity() {
    return FeedHeader(title: title, bannerImage: bannerImage);
  }
}

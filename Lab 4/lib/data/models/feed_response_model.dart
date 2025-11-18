import 'package:json_annotation/json_annotation.dart';
import 'feed_header_model.dart';
import 'feed_section_model.dart';

part 'feed_response_model.g.dart';

@JsonSerializable()
class FeedResponseModel {
  final FeedHeaderModel header;
  final List<FeedSectionModel> sections;

  const FeedResponseModel({required this.header, required this.sections});

  factory FeedResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FeedResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedResponseModelToJson(this);
}

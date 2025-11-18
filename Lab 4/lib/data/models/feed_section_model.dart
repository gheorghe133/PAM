import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/feed_section.dart';
import 'feed_item_model.dart';

part 'feed_section_model.g.dart';

/// Data model for feed section with JSON serialization
@JsonSerializable()
class FeedSectionModel {
  final String title;
  final String subtitle;
  final List<FeedItemModel> items;

  const FeedSectionModel({
    required this.title,
    required this.subtitle,
    required this.items,
  });

  factory FeedSectionModel.fromJson(Map<String, dynamic> json) =>
      _$FeedSectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedSectionModelToJson(this);

  /// Convert data model to domain entity
  FeedSection toEntity() {
    return FeedSection(
      title: title,
      subtitle: subtitle,
      items: items.map((item) => item.toEntity()).toList(),
    );
  }
}


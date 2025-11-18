import 'package:equatable/equatable.dart';
import 'feed_item.dart';

/// Domain entity for a feed section (Sale, New, etc.)
class FeedSection extends Equatable {
  final String title;
  final String subtitle;
  final List<FeedItem> items;

  const FeedSection({
    required this.title,
    required this.subtitle,
    required this.items,
  });

  @override
  List<Object?> get props => [title, subtitle, items];
}

import 'package:equatable/equatable.dart';
import 'feed_item.dart';

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

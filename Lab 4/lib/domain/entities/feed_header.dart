import 'package:equatable/equatable.dart';

/// Domain entity for feed header
class FeedHeader extends Equatable {
  final String title;
  final String bannerImage;

  const FeedHeader({
    required this.title,
    required this.bannerImage,
  });

  @override
  List<Object?> get props => [title, bannerImage];
}

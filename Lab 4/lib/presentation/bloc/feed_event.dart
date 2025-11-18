import 'package:equatable/equatable.dart';

abstract class FeedEvent extends Equatable {
  const FeedEvent();

  @override
  List<Object?> get props => [];
}

class LoadFeed extends FeedEvent {
  const LoadFeed();
}

class RefreshFeed extends FeedEvent {
  const RefreshFeed();
}

class ToggleFeedItemFavorite extends FeedEvent {
  final int productId;

  const ToggleFeedItemFavorite(this.productId);

  @override
  List<Object?> get props => [productId];
}

class LoadProductDetail extends FeedEvent {
  final String productId;

  const LoadProductDetail(this.productId);

  @override
  List<Object?> get props => [productId];
}

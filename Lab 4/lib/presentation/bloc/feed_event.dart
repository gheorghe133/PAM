import 'package:equatable/equatable.dart';

/// Events for FeedBloc
abstract class FeedEvent extends Equatable {
  const FeedEvent();

  @override
  List<Object?> get props => [];
}

/// Load feed data
class LoadFeed extends FeedEvent {
  const LoadFeed();
}

/// Refresh feed data
class RefreshFeed extends FeedEvent {
  const RefreshFeed();
}

/// Toggle favorite status for a product
class ToggleFeedItemFavorite extends FeedEvent {
  final int productId;

  const ToggleFeedItemFavorite(this.productId);

  @override
  List<Object?> get props => [productId];
}

/// Load product details
class LoadProductDetail extends FeedEvent {
  final String productId;

  const LoadProductDetail(this.productId);

  @override
  List<Object?> get props => [productId];
}

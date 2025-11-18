import '../entities/feed_header.dart';
import '../entities/feed_section.dart';
import '../entities/product_detail.dart';

abstract class FeedRepository {
  Future<({FeedHeader header, List<FeedSection> sections})> getFeed();

  Future<ProductDetail> getProductDetails(String productId);

  Future<void> toggleFavorite(int productId, bool isFavorite);
}

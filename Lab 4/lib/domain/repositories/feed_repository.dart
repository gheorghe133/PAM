import '../entities/feed_header.dart';
import '../entities/feed_section.dart';
import '../entities/product_detail.dart';

/// Abstract repository interface for feed data
/// This is part of the Domain layer and defines the contract
/// that the Data layer must implement
abstract class FeedRepository {
  /// Get feed header and sections
  Future<({FeedHeader header, List<FeedSection> sections})> getFeed();

  /// Get product details by ID
  Future<ProductDetail> getProductDetails(String productId);

  /// Toggle favorite status for a product
  Future<void> toggleFavorite(int productId, bool isFavorite);
}

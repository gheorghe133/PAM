import '../../domain/entities/feed_header.dart';
import '../../domain/entities/feed_section.dart';
import '../../domain/entities/product_detail.dart';
import '../../domain/repositories/feed_repository.dart';
import '../datasources/remote_data_source.dart';

class FeedRepositoryImpl implements FeedRepository {
  final RemoteDataSource remoteDataSource;

  final Map<int, bool> _favoriteCache = {};

  FeedRepositoryImpl({required this.remoteDataSource});

  @override
  Future<({FeedHeader header, List<FeedSection> sections})> getFeed() async {
    try {
      final response = await remoteDataSource.getFeed();

      final sections = response.sections.map((sectionModel) {
        final section = sectionModel.toEntity();
        final updatedItems = section.items.map((item) {
          final isFavorite = _favoriteCache[item.id] ?? item.isFavorite;
          return item.copyWith(isFavorite: isFavorite);
        }).toList();

        return FeedSection(
          title: section.title,
          subtitle: section.subtitle,
          items: updatedItems,
        );
      }).toList();

      return (header: response.header.toEntity(), sections: sections);
    } catch (e) {
      throw RepositoryException('Failed to get feed: $e');
    }
  }

  @override
  Future<ProductDetail> getProductDetails(String productId) async {
    try {
      final response = await remoteDataSource.getProductDetails(productId);
      final relatedProducts = response.relatedProducts
          .map((model) => model.toEntity())
          .toList();

      return response.product.toEntity(relatedProducts);
    } catch (e) {
      throw RepositoryException('Failed to get product details: $e');
    }
  }

  @override
  Future<void> toggleFavorite(int productId, bool isFavorite) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));

      _favoriteCache[productId] = isFavorite;
    } catch (e) {
      throw RepositoryException('Failed to toggle favorite: $e');
    }
  }
}

class RepositoryException implements Exception {
  final String message;

  const RepositoryException(this.message);

  @override
  String toString() => 'RepositoryException: $message';
}

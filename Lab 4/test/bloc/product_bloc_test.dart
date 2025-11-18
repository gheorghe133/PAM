import 'package:flutter_test/flutter_test.dart';
import 'package:street_clothes_template/presentation/bloc/bloc.dart';
import 'package:street_clothes_template/domain/repositories/feed_repository.dart';
import 'package:street_clothes_template/domain/entities/feed_header.dart';
import 'package:street_clothes_template/domain/entities/feed_section.dart';
import 'package:street_clothes_template/domain/entities/feed_item.dart';
import 'package:street_clothes_template/domain/entities/product_detail.dart';

// Mock repository for testing
class MockFeedRepository implements FeedRepository {
  final Map<int, bool> _favoriteCache = {};

  @override
  Future<({FeedHeader header, List<FeedSection> sections})> getFeed() async {
    // Return test data without delay for faster tests
    final header = const FeedHeader(
      title: 'Test Feed',
      bannerImage: 'test_banner.jpg',
    );

    final sections = [
      FeedSection(
        title: 'Sale',
        subtitle: 'Super summer sale',
        items: [
          FeedItem(
            id: 1,
            brand: 'Test Brand',
            name: 'Test Product',
            image: 'test1.png',
            price: 80.0,
            oldPrice: 100.0,
            discount: 20,
            rating: 5.0,
            reviews: 10,
            isFavorite: _favoriteCache[1] ?? false,
            isNew: false,
          ),
        ],
      ),
      FeedSection(
        title: 'New',
        subtitle: 'You\'ve never seen it before!',
        items: [
          FeedItem(
            id: 2,
            brand: 'New Brand',
            name: 'New Product',
            image: 'test2.png',
            price: 50.0,
            rating: 0.0,
            reviews: 0,
            isFavorite: _favoriteCache[2] ?? false,
            isNew: true,
          ),
        ],
      ),
    ];

    return (header: header, sections: sections);
  }

  @override
  Future<ProductDetail> getProductDetails(String productId) async {
    // Return mock product detail
    return const ProductDetail(
      id: '1',
      title: 'Test Product',
      brand: 'Test Brand',
      description: 'Test description',
      price: 80.0,
      currency: '\$',
      rating: 5.0,
      reviewsCount: 10,
      colors: [],
      sizes: ['S', 'M', 'L'],
      shippingInfo: ShippingInfo(
        delivery: 'Standard delivery',
        returns: '30 days return',
      ),
      support: SupportInfo(
        contactEmail: 'test@example.com',
        faqUrl: 'https://example.com/faq',
      ),
      actions: ProductActions(
        addToCart: true,
        addToWishlist: true,
        share: true,
      ),
      relatedProducts: [],
    );
  }

  @override
  Future<void> toggleFavorite(int productId, bool isFavorite) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 100));
    _favoriteCache[productId] = isFavorite;
  }
}

void main() {
  group('FeedBloc', () {
    late FeedBloc feedBloc;
    late MockFeedRepository mockRepository;

    setUp(() {
      mockRepository = MockFeedRepository();
      feedBloc = FeedBloc(repository: mockRepository);
    });

    tearDown(() {
      feedBloc.close();
    });

    test('initial state is FeedInitial', () {
      expect(feedBloc.state, equals(const FeedInitial()));
    });

    test('loads feed successfully', () async {
      // Act
      feedBloc.add(const LoadFeed());

      // Wait for the state to change
      await expectLater(
        feedBloc.stream,
        emitsInOrder([
          isA<FeedLoading>(),
          isA<FeedLoaded>().having(
            (state) => state.sections.length,
            'sections length',
            2,
          ),
        ]),
      );
    });

    test('loads feed with correct data', () async {
      // Act
      feedBloc.add(const LoadFeed());

      // Wait for FeedLoaded state
      await feedBloc.stream.firstWhere((state) => state is FeedLoaded);

      final state = feedBloc.state as FeedLoaded;

      expect(state.header.title, equals('Test Feed'));
      expect(state.sections.length, equals(2));
      expect(state.sections[0].title, equals('Sale'));
      expect(state.sections[1].title, equals('New'));
      expect(state.sections[0].items.length, equals(1));
      expect(state.sections[1].items.length, equals(1));
    });

    test('toggles favorite status', () async {
      // First load feed
      feedBloc.add(const LoadFeed());
      await feedBloc.stream.firstWhere((state) => state is FeedLoaded);

      // Then toggle favorite
      feedBloc.add(const ToggleFeedItemFavorite(1));

      await expectLater(
        feedBloc.stream,
        emitsInOrder([
          isA<FeedUpdating>(),
          isA<FeedLoaded>().having(
            (state) {
              final item = state.sections[0].items.firstWhere((p) => p.id == 1);
              return item.isFavorite;
            },
            'first product isFavorite',
            true,
          ),
        ]),
      );
    });

    test('loads product details by ID', () async {
      // Act
      feedBloc.add(const LoadProductDetail('1'));

      // Wait for the state to change
      await expectLater(
        feedBloc.stream,
        emitsInOrder([
          isA<FeedLoading>(),
          isA<ProductDetailLoaded>()
              .having((state) => state.productDetail.id, 'product id', '1')
              .having(
                (state) => state.productDetail.brand,
                'product brand',
                'Test Brand',
              ),
        ]),
      );
    });

    test('refreshes feed successfully', () async {
      // First load feed
      feedBloc.add(const LoadFeed());
      await feedBloc.stream.firstWhere((state) => state is FeedLoaded);

      // Then refresh
      feedBloc.add(const RefreshFeed());

      await expectLater(
        feedBloc.stream,
        emitsInOrder([
          isA<FeedLoading>(),
          isA<FeedLoaded>(),
        ]),
      );
    });
  });
}

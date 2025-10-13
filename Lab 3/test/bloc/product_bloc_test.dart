import 'package:flutter_test/flutter_test.dart';
import 'package:street_clothes_template/bloc/bloc.dart';
import 'package:street_clothes_template/data/product_repository.dart';
import 'package:street_clothes_template/models/product.dart';

// Mock repository for testing
class MockProductRepository extends ProductRepository {
  @override
  Future<List<Product>> loadProducts() async {
    // Return test data without delay for faster tests
    return [
      const Product(
        id: '1',
        imagePath: 'test1.png',
        saleLabel: '-20%',
        rating: 5.0,
        reviewCount: 10,
        brandName: 'Test Brand',
        itemName: 'Test Product',
        oldPrice: 100.0,
        newPrice: 80.0,
        isNew: false,
        isFavorite: false,
      ),
      const Product(
        id: '2',
        imagePath: 'test2.png',
        rating: 0.0,
        reviewCount: 0,
        brandName: 'New Brand',
        itemName: 'New Product',
        oldPrice: 50.0,
        newPrice: 50.0,
        isNew: true,
        isFavorite: false,
      ),
    ];
  }

  @override
  Future<Product> updateProduct(Product product) async {
    return product;
  }
}

void main() {
  group('ProductBloc', () {
    late ProductBloc productBloc;
    late MockProductRepository mockRepository;

    setUp(() {
      mockRepository = MockProductRepository();
      productBloc = ProductBloc(repository: mockRepository);
    });

    tearDown(() {
      productBloc.close();
    });

    test('initial state is ProductInitial', () {
      expect(productBloc.state, equals(const ProductInitial()));
    });

    test('loads products successfully', () async {
      // Act
      productBloc.add(const LoadProducts());

      // Wait for the state to change
      await expectLater(
        productBloc.stream,
        emitsInOrder([
          isA<ProductLoading>(),
          isA<ProductLoaded>().having(
            (state) => state.products.length,
            'products length',
            2,
          ),
        ]),
      );
    });

    test('toggles favorite status', () async {
      // First load products
      productBloc.add(const LoadProducts());
      await productBloc.stream.firstWhere((state) => state is ProductLoaded);

      // Then toggle favorite
      productBloc.add(const ToggleFavorite('1'));

      await expectLater(
        productBloc.stream,
        emitsInOrder([
          isA<ProductUpdating>(),
          isA<ProductLoaded>().having(
            (state) => state.products.firstWhere((p) => p.id == '1').isFavorite,
            'first product isFavorite',
            true,
          ),
        ]),
      );
    });

    test('loads specific product by ID', () async {
      // Act
      productBloc.add(const LoadProductById('1'));

      // Wait for the state to change
      await expectLater(
        productBloc.stream,
        emitsInOrder([
          isA<ProductLoading>(),
          isA<ProductSelected>()
              .having((state) => state.product.id, 'product id', '1')
              .having(
                (state) => state.product.brandName,
                'product brand',
                'Test Brand',
              ),
        ]),
      );
    });
  });
}

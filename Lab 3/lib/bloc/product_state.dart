import 'package:equatable/equatable.dart';
import '../models/product.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

/// Initial state when the app starts
class ProductInitial extends ProductState {
  const ProductInitial();
}

/// State when products are being loaded
class ProductLoading extends ProductState {
  const ProductLoading();
}

/// State when products are successfully loaded
class ProductLoaded extends ProductState {
  final List<Product> products;
  final List<Product> allProducts; // Keep original list for reference

  const ProductLoaded({required this.products, required this.allProducts});

  @override
  List<Object?> get props => [products, allProducts];

  /// Helper getters for categorized products
  List<Product> get saleProducts => products.where((p) => p.isOnSale).toList();
  List<Product> get newProducts => products.where((p) => p.isNew).toList();
  List<Product> get favoriteProducts =>
      products.where((p) => p.isFavorite).toList();

  /// Copy with method for state updates
  ProductLoaded copyWith({
    List<Product>? products,
    List<Product>? allProducts,
  }) {
    return ProductLoaded(
      products: products ?? this.products,
      allProducts: allProducts ?? this.allProducts,
    );
  }
}

/// State when there's an error loading products
class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object?> get props => [message];
}

/// State when updating a specific product (e.g., toggling favorite)
class ProductUpdating extends ProductState {
  final String productId;
  final List<Product> products; // Keep current products visible

  const ProductUpdating({required this.productId, required this.products});

  @override
  List<Object?> get props => [productId, products];
}

/// State when a specific product is selected/loaded
class ProductSelected extends ProductState {
  final Product product;
  final List<Product> allProducts; // Keep all products for context

  const ProductSelected({required this.product, required this.allProducts});

  @override
  List<Object?> get props => [product, allProducts];

  /// Copy with method for state updates
  ProductSelected copyWith({
    Product? product,
    List<Product>? allProducts,
  }) {
    return ProductSelected(
      product: product ?? this.product,
      allProducts: allProducts ?? this.allProducts,
    );
  }
}

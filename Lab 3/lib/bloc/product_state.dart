import 'package:equatable/equatable.dart';
import '../models/product.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {
  const ProductInitial();
}

class ProductLoading extends ProductState {
  const ProductLoading();
}

class ProductLoaded extends ProductState {
  final List<Product> products;
  final List<Product> allProducts;

  const ProductLoaded({required this.products, required this.allProducts});

  @override
  List<Object?> get props => [products, allProducts];

  List<Product> get saleProducts => products.where((p) => p.isOnSale).toList();
  List<Product> get newProducts => products.where((p) => p.isNew).toList();
  List<Product> get favoriteProducts =>
      products.where((p) => p.isFavorite).toList();

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

class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object?> get props => [message];
}

class ProductUpdating extends ProductState {
  final String productId;
  final List<Product> products;

  const ProductUpdating({required this.productId, required this.products});

  @override
  List<Object?> get props => [productId, products];
}

class ProductSelected extends ProductState {
  final Product product;
  final List<Product> allProducts;

  const ProductSelected({required this.product, required this.allProducts});

  @override
  List<Object?> get props => [product, allProducts];

  ProductSelected copyWith({Product? product, List<Product>? allProducts}) {
    return ProductSelected(
      product: product ?? this.product,
      allProducts: allProducts ?? this.allProducts,
    );
  }
}

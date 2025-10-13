import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/product_repository.dart';
import '../models/product.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _repository;

  ProductBloc({ProductRepository? repository})
    : _repository = repository ?? ProductRepository(),
      super(const ProductInitial()) {
    // Register event handlers
    on<LoadProducts>(_onLoadProducts);
    on<RefreshProducts>(_onRefreshProducts);
    on<ToggleFavorite>(_onToggleFavorite);
    on<LoadProductById>(_onLoadProductById);
  }

  /// Handles loading products from repository
  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductLoading());

    try {
      final products = await _repository.loadProducts();
      emit(ProductLoaded(products: products, allProducts: products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  /// Handles refreshing products
  Future<void> _onRefreshProducts(
    RefreshProducts event,
    Emitter<ProductState> emit,
  ) async {
    // Keep current products visible while refreshing
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      emit(ProductLoading());

      try {
        final products = await _repository.loadProducts();
        emit(ProductLoaded(products: products, allProducts: products));
      } catch (e) {
        // Restore previous state on error
        emit(currentState);
        emit(ProductError(e.toString()));
      }
    } else {
      // If no products loaded yet, just load them
      add(const LoadProducts());
    }
  }

  /// Handles toggling favorite status
  Future<void> _onToggleFavorite(
    ToggleFavorite event,
    Emitter<ProductState> emit,
  ) async {
    if (state is! ProductLoaded) return;

    final currentState = state as ProductLoaded;

    // Show updating state
    emit(
      ProductUpdating(
        productId: event.productId,
        products: currentState.products,
      ),
    );

    try {
      // Find and update the product
      final updatedAllProducts = currentState.allProducts.map((product) {
        if (product.id == event.productId) {
          return product.copyWith(isFavorite: !product.isFavorite);
        }
        return product;
      }).toList();

      // Simulate API call
      await _repository.updateProduct(
        updatedAllProducts.firstWhere((p) => p.id == event.productId),
      );

      emit(
        currentState.copyWith(
          products: updatedAllProducts,
          allProducts: updatedAllProducts,
        ),
      );
    } catch (e) {
      // Restore previous state on error
      emit(currentState);
      emit(ProductError('Failed to update favorite: $e'));
    }
  }

  /// Handles loading a specific product by ID
  Future<void> _onLoadProductById(
    LoadProductById event,
    Emitter<ProductState> emit,
  ) async {
    try {
      // Show loading only if we're refreshing an already selected product
      bool isRefresh = state is ProductSelected &&
                      (state as ProductSelected).product.id == event.productId;

      if (isRefresh) {
        emit(const ProductLoading());
      }

      // First ensure we have all products loaded
      List<Product> allProducts;

      if (state is ProductLoaded || state is ProductSelected) {
        // Extract allProducts from current state
        allProducts = state is ProductLoaded
            ? (state as ProductLoaded).allProducts
            : (state as ProductSelected).allProducts;
      } else {
        // Load all products if not already loaded
        if (!isRefresh) {
          emit(const ProductLoading());
        }
        allProducts = await _repository.loadProducts();
      }

      // Find the specific product
      final product = allProducts.firstWhere(
        (p) => p.id == event.productId,
        orElse: () =>
            throw Exception('Product with ID ${event.productId} not found'),
      );

      emit(ProductSelected(product: product, allProducts: allProducts));
    } catch (e) {
      emit(ProductError('Failed to load product: $e'));
    }
  }
}

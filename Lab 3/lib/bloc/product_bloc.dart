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
    on<LoadProducts>(_onLoadProducts);
    on<RefreshProducts>(_onRefreshProducts);
    on<ToggleFavorite>(_onToggleFavorite);
    on<LoadProductById>(_onLoadProductById);
  }

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

  Future<void> _onRefreshProducts(
    RefreshProducts event,
    Emitter<ProductState> emit,
  ) async {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      emit(ProductLoading());

      try {
        final products = await _repository.loadProducts();
        emit(ProductLoaded(products: products, allProducts: products));
      } catch (e) {
        emit(currentState);
        emit(ProductError(e.toString()));
      }
    } else {
      add(const LoadProducts());
    }
  }

  Future<void> _onToggleFavorite(
    ToggleFavorite event,
    Emitter<ProductState> emit,
  ) async {
    if (state is! ProductLoaded) return;

    final currentState = state as ProductLoaded;

    emit(
      ProductUpdating(
        productId: event.productId,
        products: currentState.products,
      ),
    );

    try {
      final updatedAllProducts = currentState.allProducts.map((product) {
        if (product.id == event.productId) {
          return product.copyWith(isFavorite: !product.isFavorite);
        }
        return product;
      }).toList();

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
      emit(currentState);
      emit(ProductError('Failed to update favorite: $e'));
    }
  }

  Future<void> _onLoadProductById(
    LoadProductById event,
    Emitter<ProductState> emit,
  ) async {
    try {
      bool isRefresh =
          state is ProductSelected &&
          (state as ProductSelected).product.id == event.productId;

      if (isRefresh) {
        emit(const ProductLoading());
      }

      List<Product> allProducts;

      if (state is ProductLoaded || state is ProductSelected) {
        allProducts = state is ProductLoaded
            ? (state as ProductLoaded).allProducts
            : (state as ProductSelected).allProducts;
      } else {
        if (!isRefresh) {
          emit(const ProductLoading());
        }
        allProducts = await _repository.loadProducts();
      }

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

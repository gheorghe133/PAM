import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load all products from JSON
class LoadProducts extends ProductEvent {
  const LoadProducts();
}

/// Event to refresh products (reload from JSON)
class RefreshProducts extends ProductEvent {
  const RefreshProducts();
}

/// Event to toggle favorite status of a product
class ToggleFavorite extends ProductEvent {
  final String productId;

  const ToggleFavorite(this.productId);

  @override
  List<Object?> get props => [productId];
}

/// Event to load a specific product by ID
class LoadProductById extends ProductEvent {
  final String productId;

  const LoadProductById(this.productId);

  @override
  List<Object?> get props => [productId];
}

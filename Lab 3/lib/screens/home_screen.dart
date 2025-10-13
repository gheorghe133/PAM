import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/hero_section.dart';
import '../widgets/product_section.dart';
import '../widgets/custom_status_bar.dart';

import '../models/product.dart';
import '../bloc/bloc.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductInitial || state is ProductLoading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text(
                    'Loading products...',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            );
          }

          if (state is ProductError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Error loading products',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ProductBloc>().add(const LoadProducts());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is ProductLoaded ||
              state is ProductUpdating ||
              state is ProductSelected) {
            final products = state is ProductLoaded
                ? state.products
                : state is ProductUpdating
                ? state.products
                : (state as ProductSelected).allProducts;

            return RefreshIndicator(
              onRefresh: () async {
                context.read<ProductBloc>().add(const RefreshProducts());
                // Wait for the refresh to complete
                await context.read<ProductBloc>().stream.firstWhere(
                  (state) => state is! ProductLoading,
                );
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hero Section
                    const StreetClothesHeroSection(),

                    // Sales Section
                    SalesSection(
                      products: products,
                      onViewAllPressed: () =>
                          _onViewAllPressed(context, 'Sale'),
                      onProductTap: (product) =>
                          _onProductTap(context, product),
                      onFavoritePressed: (product) =>
                          _onFavoritePressed(context, product),
                    ),

                    // New Section
                    NewSection(
                      products: products,
                      onViewAllPressed: () => _onViewAllPressed(context, 'New'),
                      onProductTap: (product) =>
                          _onProductTap(context, product),
                      onFavoritePressed: (product) =>
                          _onFavoritePressed(context, product),
                    ),
                  ],
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _onViewAllPressed(BuildContext context, String section) {
    // Navigate to category page or show all products
    // For now, just show a message
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('View all $section products')));
  }

  void _onProductTap(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(productId: product.id),
      ),
    );
  }

  void _onFavoritePressed(BuildContext context, Product product) {
    // Use BLoC to toggle favorite status
    context.read<ProductBloc>().add(ToggleFavorite(product.id));
  }
}

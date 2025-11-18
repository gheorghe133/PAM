import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/hero_section.dart';
import '../../widgets/product_section.dart';
import '../../widgets/custom_status_bar.dart';
import '../../widgets/product.dart';
import 'product_detail_screen.dart';

import '../bloc/bloc.dart';
import '../../domain/entities/feed_item.dart';
import '../../domain/entities/feed_header.dart';
import '../../domain/entities/feed_section.dart';
import '../../core/constants.dart';

class HomeScreenNew extends StatelessWidget {
  const HomeScreenNew({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<FeedBloc, FeedState>(
        builder: (context, state) {
          if (state is FeedInitial || state is FeedLoading) {
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

          if (state is FeedError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  const Text(
                    'Error loading products',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                      context.read<FeedBloc>().add(const LoadFeed());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is FeedLoaded ||
              state is FeedUpdating ||
              state is ProductDetailLoaded) {
            // Derive header and sections from any compatible state so the feed
            // remains visible even after viewing a product detail.
            late final FeedHeader header;
            late final List<FeedSection> sections;

            if (state is FeedLoaded) {
              header = state.header;
              sections = state.sections;
            } else if (state is FeedUpdating) {
              header = state.header;
              sections = state.sections;
            } else if (state is ProductDetailLoaded) {
              if (state.header != null && state.sections != null) {
                header = state.header!;
                sections = state.sections!;
              } else {
                // If we don't have feed data (e.g., deep link into details),
                // show a simple loading state instead of a blank screen.
                return const Center(child: CircularProgressIndicator());
              }
            }

            // Convert FeedItems to Products for compatibility with existing widgets
            final allProducts = sections
                .expand((FeedSection section) => section.items)
                .map(_feedItemToProduct)
                .toList();

            return RefreshIndicator(
              onRefresh: () async {
                context.read<FeedBloc>().add(const RefreshFeed());

                await context.read<FeedBloc>().stream.firstWhere(
                  (state) => state is! FeedLoading,
                );
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StreetClothesHeroSection(
                      bannerImage: header.bannerImage,
                      title: header.title,
                    ),
                    SalesSection(
                      products: allProducts,
                      onViewAllPressed: () =>
                          _onViewAllPressed(context, 'Sale'),
                      onProductTap: (product) =>
                          _onProductTap(context, product),
                      onFavoritePressed: (product) =>
                          _onFavoritePressed(context, product),
                    ),
                    NewSection(
                      products: allProducts,
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

          // Fallback: if we reach here with an unexpected state, show a
          // basic loading indicator instead of a blank screen.
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  /// Convert FeedItem entity to Product model for widget compatibility.
  /// Prefer the API image URL, but fall back to the global placeholder if needed.
  Product _feedItemToProduct(FeedItem item) {
    final image = item.image.isEmpty
        ? AppConstants.fallbackImageUrl
        : item.image;

    return Product(
      id: item.id.toString(),
      imagePath: image,
      saleLabel: item.discount != null ? '-${item.discount}%' : null,
      rating: item.rating,
      reviewCount: item.reviews,
      brandName: item.brand,
      itemName: item.name,
      oldPrice: item.oldPrice ?? item.price,
      newPrice: item.price,
      isNew: item.isNew,
      isFavorite: item.isFavorite,
    );
  }

  void _onViewAllPressed(BuildContext context, String section) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('View all $section products')));
  }

  void _onProductTap(BuildContext context, Product product) {
    final productId = product.id;
    context.read<FeedBloc>().add(LoadProductDetail(productId));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (newContext) => BlocProvider.value(
          value: context.read<FeedBloc>(),
          child: ProductDetailScreen(productId: productId),
        ),
      ),
    );
  }

  void _onFavoritePressed(BuildContext context, Product product) {
    context.read<FeedBloc>().add(ToggleFeedItemFavorite(int.parse(product.id)));
  }
}

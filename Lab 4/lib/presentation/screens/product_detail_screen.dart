import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../../widgets/custom_status_bar.dart';
import '../../widgets/product_images.dart';
import '../../widgets/size_color_selector.dart';
import '../../widgets/product_info.dart';
import '../../widgets/product_description.dart';
import '../../widgets/expandable_sections.dart';
import '../../widgets/related_products.dart';
import '../../widgets/add_to_cart.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String selectedSize = 'Size';
  String selectedColor = 'Black';

  @override
  void initState() {
    super.initState();
    context.read<FeedBloc>().add(LoadProductDetail(widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: BlocBuilder<FeedBloc, FeedState>(
        builder: (context, state) {
          if (state is ProductDetailLoaded) {
            final detail = state.productDetail;

            return Column(
              children: [
                Expanded(
                  child: Container(
                    color: const Color(0xFFFFFFFF),
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context.read<FeedBloc>().add(
                          LoadProductDetail(widget.productId),
                        );

                        await context.read<FeedBloc>().stream.firstWhere(
                          (state) => state is! FeedLoading,
                        );
                      },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ProductImages(),

                            SizeColorSelector(
                              selectedSize: selectedSize,
                              selectedColor: selectedColor,
                              onSizeChanged: (size) {
                                setState(() {
                                  selectedSize = size;
                                });
                              },
                              onColorChanged: (color) {
                                setState(() {
                                  selectedColor = color;
                                });
                              },
                            ),

                            const ProductInfo(),
                            const ProductDescription(),
                            const ExpandableSections(),
                            const RelatedProducts(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                AddToCart(onAddToCart: () => _onAddToCart(detail)),
              ],
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
                    'Error loading product',
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
                      context.read<FeedBloc>().add(
                        LoadProductDetail(widget.productId),
                      );
                    },
                    child: const Text('Retry'),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Go Back'),
                  ),
                ],
              ),
            );
          }

          // For initial, loading, and other non-detail states, show a loading
          // indicator instead of a temporary "not found" message.
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text(
                  'Loading product...',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onAddToCart(detail) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${detail.title} added to cart!'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

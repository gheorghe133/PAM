import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product.dart';
import '../bloc/bloc.dart';
import '../widgets/product_images.dart';
import '../widgets/size_color_selector.dart';
import '../widgets/product_info.dart';
import '../widgets/product_description.dart';
import '../widgets/expandable_sections.dart';
import '../widgets/related_products.dart';
import '../widgets/add_to_cart.dart';
import '../widgets/custom_status_bar.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;

  const ProductDetailScreen({Key? key, required this.productId})
    : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String selectedSize = 'Size';
  String selectedColor = 'Black';

  @override
  void initState() {
    super.initState();
    // Load the specific product when screen initializes
    context.read<ProductBloc>().add(LoadProductById(widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
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
          }

          if (state is ProductError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Error loading product',
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
                      context.read<ProductBloc>().add(
                        LoadProductById(widget.productId),
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

          if (state is ProductSelected) {
            final product = state.product;

            return Column(
              children: [
                // Scrollable content
                Expanded(
                  child: Container(
                    color: const Color(0xFFFFFFFF),
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context.read<ProductBloc>().add(
                          LoadProductById(widget.productId),
                        );
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
                            // Product Images (now includes status bar and app bar)
                            ProductImages(),

                            // Size and Color Selector
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

                            // Product Info (Brand, Name, Price, Rating)
                            ProductInfo(),

                            // Product Description
                            ProductDescription(),

                            // Expandable Sections (Item details, Shipping info, Support)
                            ExpandableSections(),

                            // Related Products
                            RelatedProducts(),

                            // Bottom spacing to prevent content from being hidden behind the button
                            const SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Fixed Add to Cart Button at bottom (no padding)
                AddToCart(onAddToCart: () => _onAddToCart(product)),
              ],
            );
          }

          // Fallback for other states
          return const Center(child: Text('Product not found'));
        },
      ),
    );
  }

  void _onAddToCart(Product product) {
    // Add product to cart logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.itemName} added to cart!'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

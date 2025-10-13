import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import '../models/product.dart';
import '../screens/product_detail_screen.dart';
import 'product_card.dart';

class RelatedProducts extends StatelessWidget {
  const RelatedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        List<Product> products = [];

        // Extract products from current state
        if (state is ProductLoaded) {
          products = state.allProducts;
        } else if (state is ProductSelected) {
          products = state.allProducts;
        }

        // Show specific products as before: Sales ID '1', New ID '5', New ID '5'
        final relatedProducts = <Product>[];

        // First product - Sales (ID '1')
        final salesProduct = products.firstWhere(
          (p) => p.id == '1',
          orElse: () => products.isNotEmpty ? products[0] : products.first,
        );
        relatedProducts.add(salesProduct);

        // Second product - New (ID '5')
        final newProduct = products.firstWhere(
          (p) => p.id == '5',
          orElse: () => products.length > 4 ? products[4] : products.last,
        );
        relatedProducts.add(newProduct);

        // Third product - same as second (ID '5')
        relatedProducts.add(newProduct);

        return Column(
          children: [
            // Section header
            Container(
              margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      relatedProducts.isNotEmpty
                          ? (relatedProducts.first.relatedSectionTitle ?? "You can also like this")
                          : "You can also like this",
                      style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    relatedProducts.isNotEmpty
                        ? (relatedProducts.first.relatedItemsCount ?? "12 items")
                        : "12 items",
                    style: TextStyle(color: Color(0xFF9B9B9B), fontSize: 11),
                  ),
                ],
              ),
            ),

            // Products horizontal scroll
            Container(
              margin: const EdgeInsets.only(bottom: 101),
              width: double.infinity,
              height: 300,
              child: relatedProducts.isEmpty
                  ? Center(
                      child: Text(
                        "No related products available",
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      itemCount: relatedProducts.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final product = relatedProducts[index];
                        return ProductCard(
                          product: product,
                          width: 148,
                          height: 300,
                          onTap: () {
                            // Navigate to product detail page
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailScreen(productId: product.id),
                              ),
                            );
                          },
                          onFavoritePressed: () {
                            // Toggle favorite status
                            context.read<ProductBloc>().add(
                              ToggleFavorite(product.id),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}

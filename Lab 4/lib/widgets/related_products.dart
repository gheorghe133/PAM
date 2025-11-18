import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/bloc/bloc.dart';
import '../presentation/screens/product_detail_screen.dart';
import 'product_card.dart';
import 'product.dart';

class RelatedProducts extends StatelessWidget {
  const RelatedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      builder: (context, state) {
        List<Product> relatedProducts = [];

        if (state is ProductDetailLoaded) {
          // Convert related products from detail to Product entities, using the
          // per-product image URL (which already applies a fallback at model level).
          relatedProducts = state.productDetail.relatedProducts.map((rp) {
            return Product(
              id: rp.id,
              imagePath: rp.image,
              saleLabel: rp.oldPrice != null
                  ? '-${((1 - rp.price / rp.oldPrice!) * 100).toStringAsFixed(0)}%'
                  : null,
              rating: rp.rating,
              reviewCount: rp.reviewsCount,
              brandName: rp.brand,
              itemName: rp.title,
              oldPrice: rp.oldPrice ?? rp.price,
              newPrice: rp.price,
              isNew: false,
              isFavorite: false,
            );
          }).toList();
        }

        return Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
              width: double.infinity,
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "You can also like this",
                      style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    "${relatedProducts.length} items",
                    style: const TextStyle(color: Color(0xFF9B9B9B), fontSize: 11),
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.only(bottom: 101),
              width: double.infinity,
              height: 300,
              child: relatedProducts.isEmpty
                  ? const Center(
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
                            // Load the new product detail
                            context.read<FeedBloc>().add(LoadProductDetail(product.id));
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (newContext) => BlocProvider.value(
                                  value: context.read<FeedBloc>(),
                                  child: ProductDetailScreen(productId: product.id),
                                ),
                              ),
                            );
                          },
                          // No favorite functionality for related products
                          onFavoritePressed: null,
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

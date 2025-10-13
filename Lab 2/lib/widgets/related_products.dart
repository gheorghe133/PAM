import 'package:flutter/material.dart';
import '../data/sample_products.dart';
import 'product_card.dart';

class RelatedProducts extends StatelessWidget {
  const RelatedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Container(
            margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      "You can also like this",
                      style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Text(
                  "12 items",
                  style: TextStyle(color: Color(0xFF9B9B9B), fontSize: 11),
                ),
              ],
            ),
          ),
        ),

        IntrinsicWidth(
          child: IntrinsicHeight(
            child: Container(
              margin: const EdgeInsets.only(bottom: 101),
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: ProductCard(
                          product: SampleProducts.allProducts[0],
                          width: 148,
                          height: 300,
                          onTap: () {},
                          onFavoritePressed: () {},
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: ProductCard(
                          product: SampleProducts.allProducts[4],
                          width: 148,
                          height: 300,
                          onTap: () {},
                          onFavoritePressed: () {},
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: ProductCard(
                          product: SampleProducts.allProducts[4],
                          width: 148,
                          height: 300,
                          onTap: () {},
                          onFavoritePressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

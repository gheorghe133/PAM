import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/sample_products.dart';
import 'product_card.dart';

class RelatedProducts extends StatelessWidget {
  const RelatedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section header
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
                      style: TextStyle(color: Color(0xFF222222), fontSize: 18),
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

        // Products horizontal scroll
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
                      // First product - primul card de la Sales (ID '1')
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: ProductCard(
                          product: SampleProducts
                              .allProducts[0], // ID '1' - primul de la Sales
                          width: 148,
                          height: 300,
                          onTap: () => print('Related product 1 tapped'),
                          onFavoritePressed: () =>
                              print('Related product 1 favorite pressed'),
                        ),
                      ),

                      // Second product - al doilea card de la New (ID '5')
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: ProductCard(
                          product: SampleProducts
                              .allProducts[4], // ID '5' - al doilea de la New
                          width: 148,
                          height: 300,
                          onTap: () => print('Related product 2 tapped'),
                          onFavoritePressed: () =>
                              print('Related product 2 favorite pressed'),
                        ),
                      ),

                      // Third product - al treilea card de la New (ID '6')
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: ProductCard(
                          product: SampleProducts
                              .allProducts[5], // ID '6' - al treilea de la New
                          width: 148,
                          height: 300,
                          onTap: () => print('Related product 3 tapped'),
                          onFavoritePressed: () =>
                              print('Related product 3 favorite pressed'),
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

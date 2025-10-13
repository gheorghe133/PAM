import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductSelected) {
          final product = state.product;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Brand and Price Row
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        product.detailBrand ?? "H&M",
                        style: TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      product.detailPrice ?? "19.99\$",
                      style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),

              // Product Name - using hardcoded data from JSON
              Container(
                margin: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
                child: Text(
                  product.detailTitle ?? "Short black dress",
                  style: TextStyle(
                    color: Color(0xFF9B9B9B),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              // Rating Stars
              Container(
                margin: const EdgeInsets.only(bottom: 20, left: 17),
                child: Row(
                  children: [
                    // Stars based on product rating
                    ...List.generate(
                      5,
                      (index) => Container(
                        margin: const EdgeInsets.only(right: 1),
                        width: 14,
                        height: 14,
                        child: Icon(
                          Icons.star,
                          size: 14,
                          color: index < product.rating.floor()
                              ? Color(0xFFFFBA49)
                              : Color(0xFFE0E0E0),
                        ),
                      ),
                    ),

                    // Review count
                    Container(
                      margin: const EdgeInsets.only(left: 2),
                      child: Text(
                        "(${product.reviewCount})",
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }

        // Fallback for when no product is selected
        return SizedBox.shrink();
      },
    );
  }
}

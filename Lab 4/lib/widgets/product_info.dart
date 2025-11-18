import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/bloc/bloc.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      builder: (context, state) {
        if (state is ProductDetailLoaded) {
          final detail = state.productDetail;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        detail.brand,
                        style: const TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      "${detail.price}${detail.currency}",
                      style: const TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
                child: Text(
                  detail.title,
                  style: const TextStyle(
                    color: Color(0xFF9B9B9B),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 20, left: 17),
                child: Row(
                  children: [
                    ...List.generate(
                      5,
                      (index) => Container(
                        margin: const EdgeInsets.only(right: 1),
                        width: 14,
                        height: 14,
                        child: Icon(
                          Icons.star,
                          size: 14,
                          color: index < detail.rating.floor()
                              ? const Color(0xFFFFBA49)
                              : const Color(0xFFE0E0E0),
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(left: 2),
                      child: Text(
                        "(${detail.reviewsCount})",
                        style: const TextStyle(
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

        return const SizedBox.shrink();
      },
    );
  }
}

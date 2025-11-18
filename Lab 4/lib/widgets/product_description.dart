import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/bloc/bloc.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      builder: (context, state) {
        if (state is ProductDetailLoaded) {
          final detail = state.productDetail;
          final description = detail.description.isNotEmpty
              ? detail.description
              : "No description available.";

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  child: Text(
                    description,
                    style: const TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

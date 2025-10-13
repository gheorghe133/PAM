import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductSelected) {
          final product = state.product;
          final description =
              product.description ?? "No description available.";

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Description Text
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  child: Text(
                    description,
                    style: TextStyle(color: Color(0xFF222222), fontSize: 14),
                  ),
                ),
              ],
            ),
          );
        }

        // Fallback for when no product is selected
        return SizedBox.shrink();
      },
    );
  }
}

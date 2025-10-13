import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import 'custom_status_bar.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductSelected) {
          final product = state.product;
          final images = product.detailImages ?? [product.imagePath];

          return Column(
            children: [
              // Status bar content (9:41, WiFi, battery icons)
              const StatusBarContent(),

              // App bar (back button, title, share button)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                color: const Color(0xFFF9F9F9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back button
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const SizedBox(
                        width: 24,
                        height: 24,
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    // Title - using hardcoded data from JSON
                    Text(
                      product.detailTitle ?? "Short dress",
                      style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    // Share button
                    const SizedBox(
                      width: 24,
                      height: 24,
                      child: Icon(Icons.share, size: 18, color: Colors.black),
                    ),
                  ],
                ),
              ),
              // Image area - using images from product data
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                width: double.infinity,
                height: 400, // Standard height for product images
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: images.asMap().entries.map((entry) {
                      final index = entry.key;
                      final imagePath = entry.value;
                      final isFirst = index == 0;

                      return Row(
                        children: [
                          Container(
                            width: isFirst
                                ? MediaQuery.of(context).size.width * 0.75
                                : MediaQuery.of(context).size.width,
                            height: 400,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(imagePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          if (index < images.length - 1)
                            const SizedBox(width: 4),
                        ],
                      );
                    }).toList(),
                  ),
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

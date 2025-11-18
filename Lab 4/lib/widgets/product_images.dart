import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/bloc/bloc.dart';
import '../core/constants.dart';
import 'custom_status_bar.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      builder: (context, state) {
        if (state is ProductDetailLoaded) {
          final detail = state.productDetail;

          final images =
              detail.colors.isNotEmpty && detail.colors.first.images.isNotEmpty
              ? detail.colors.first.images
              : <String>[AppConstants.fallbackImageUrl];

          return Column(
            children: [
              const StatusBarContent(),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                color: const Color(0xFFF9F9F9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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

                    Text(
                      detail.title,
                      style: const TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(
                      width: 24,
                      height: 24,
                      child: Icon(Icons.share, size: 18, color: Colors.black),
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 12),
                width: double.infinity,
                height: 400,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: images.asMap().entries.map((entry) {
                      final index = entry.key;
                      final imageUrl = entry.value;
                      final isFirst = index == 0;
                      final width =
                          MediaQuery.of(context).size.width *
                          (isFirst ? 0.75 : 1.0);

                      final displayUrl = (index == 0 || index == 1)
                          ? AppConstants.specialOverrideImageUrl
                          : imageUrl;

                      return Row(
                        children: [
                          Container(
                            width: width,
                            height: 400,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.network(
                              displayUrl,
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value:
                                            loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                              errorBuilder: (context, error, stackTrace) {
                                return Image.network(
                                  AppConstants.fallbackImageUrl,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value:
                                                loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey[300],
                                      child: const Center(
                                        child: Icon(
                                          Icons.broken_image,
                                          size: 64,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
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

        return const SizedBox.shrink();
      },
    );
  }
}

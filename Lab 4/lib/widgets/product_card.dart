import 'package:flutter/material.dart';
import 'product.dart';
import '../core/constants.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  final VoidCallback? onFavoritePressed;
  final double? width;
  final double? height;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.onFavoritePressed,
    this.width = 148,
    this.height = 300,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                _buildProductImage(),

                Positioned(
                  bottom: -18,
                  right: 0,
                  child: Material(
                    elevation: 4,
                    shape: CircleBorder(),
                    color: Colors.white,
                    child: InkWell(
                      onTap: onFavoritePressed,
                      customBorder: CircleBorder(),
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Icon(
                          product.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 20,
                          color: product.isFavorite ? Colors.red : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 8),

            _buildRating(),

            SizedBox(height: 4),

            _buildBrandName(),

            SizedBox(height: 2),

            _buildItemName(),

            SizedBox(height: 4),

            _buildPrices(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      width: width,
      height: 184,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          // Image layer: try the product-specific image first, then fall back.
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              product.imagePath,
              fit: BoxFit.cover,
              width: width,
              height: 184,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                    strokeWidth: 2,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                // If the product image fails, try the global fallback image.
                return Image.network(
                  AppConstants.fallbackImageUrl,
                  fit: BoxFit.cover,
                  width: width,
                  height: 184,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                        strokeWidth: 2,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    // If even the fallback fails, show a broken image icon.
                    return Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 48,
                        color: Colors.grey[400],
                      ),
                    );
                  },
                );
              },
            ),
          ),

          // Sale/New label layer
          if (product.isOnSale)
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFFDB3022),
                  borderRadius: BorderRadius.circular(29),
                ),
                child: Text(
                  product.saleLabel!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

          if (product.isNew && !product.isOnSale)
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: Text(
                  'NEW',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRating() {
    return Row(
      children: [
        ...List.generate(
          5,
          (index) => Icon(
            Icons.star,
            size: 12,
            color: index < product.rating
                ? Color(0xFFFFBA49)
                : Colors.grey[300],
          ),
        ),
        SizedBox(width: 4),
        Text(
          "(${product.reviewCount})",
          style: TextStyle(color: Color(0xFF9B9B9B), fontSize: 10),
        ),
      ],
    );
  }

  Widget _buildBrandName() {
    return Text(
      product.brandName,
      style: TextStyle(
        color: Color(0xFF9B9B9B),
        fontSize: 11,
        fontWeight: FontWeight.w400,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildItemName() {
    return Text(
      product.itemName,
      style: TextStyle(
        color: Color(0xFF222222),
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildPrices() {
    return Row(
      children: [
        if (product.isOnSale) ...[
          Text(
            product.formattedOldPrice,
            style: TextStyle(
              color: Color(0xFF9B9B9B),
              fontSize: 14,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          SizedBox(width: 8),
        ],
        Text(
          product.formattedNewPrice,
          style: TextStyle(
            color: product.isOnSale ? Color(0xFFDB3022) : Color(0xFF222222),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

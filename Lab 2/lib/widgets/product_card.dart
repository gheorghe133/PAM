import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  final VoidCallback? onFavoritePressed;
  final double? width;
  final double? height;

  const ProductCard({
    Key? key,
    required this.product,
    this.onTap,
    this.onFavoritePressed,
    this.width = 148,
    this.height = 300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image with Sale Label and Favorite Button
            Stack(
              clipBehavior: Clip.none, // Permite butonului să depășească marginile
              children: [
                _buildProductImage(),
                // Favorite Button (outside image container to allow overflow)
                Positioned(
                  bottom: -18, // Jumătate din înălțimea butonului (36px / 2 = 18px) sub marginea imaginii
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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          product.isFavorite ? Icons.favorite : Icons.favorite_border,
                          size: 20,
                          color: product.isFavorite ? Colors.red : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Spațiu normal între imagine și rating
            SizedBox(height: 8),

            // Rating
            _buildRating(),

            SizedBox(height: 4),

            // Brand Name
            _buildBrandName(),

            SizedBox(height: 2),

            // Item Name
            _buildItemName(),

            SizedBox(height: 4),

            // Prices
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
        image: DecorationImage(
          image: AssetImage(product.imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Sale Label (only show if product is on sale)
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

          // New Label (only show if product is new)
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

import 'package:flutter/material.dart';
import 'product.dart';
import 'product_card.dart';

class ProductSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? viewAllText;
  final List<Product> products;
  final VoidCallback? onViewAllPressed;
  final Function(Product)? onProductTap;
  final Function(Product)? onFavoritePressed;
  final EdgeInsets? padding;
  final double? height;

  const ProductSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.products,
    this.viewAllText = "View all",
    this.onViewAllPressed,
    this.onProductTap,
    this.onFavoritePressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.height = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(),

          SizedBox(height: 15),

          _buildProductList(),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 34,
                fontWeight: FontWeight.w700,
                height: 1.0,
              ),
            ),
            SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                color: Color(0xFF9B9B9B),
                fontSize: 11,
                fontWeight: FontWeight.w400,
                height: 1.0,
              ),
            ),
          ],
        ),
        if (viewAllText != null)
          GestureDetector(
            onTap: onViewAllPressed,
            child: Text(
              viewAllText!,
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 11,
                fontWeight: FontWeight.w400,
                height: 1.0,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildProductList() {
    if (products.isEmpty) {
      return SizedBox(
        height: height,
        child: Center(
          child: Text(
            'No products available',
            style: TextStyle(color: Color(0xFF9B9B9B), fontSize: 16),
          ),
        ),
      );
    }

    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (context, index) => SizedBox(width: 16),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            product: product,
            onTap: () => onProductTap?.call(product),
            onFavoritePressed: () => onFavoritePressed?.call(product),
          );
        },
      ),
    );
  }
}

class SalesSection extends StatelessWidget {
  final List<Product> products;
  final VoidCallback? onViewAllPressed;
  final Function(Product)? onProductTap;
  final Function(Product)? onFavoritePressed;

  const SalesSection({
    super.key,
    required this.products,
    this.onViewAllPressed,
    this.onProductTap,
    this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return ProductSection(
      title: "Sale",
      subtitle: "Super summer sale",
      products: products.where((product) => product.isOnSale).toList(),
      onViewAllPressed: onViewAllPressed,
      onProductTap: onProductTap,
      onFavoritePressed: onFavoritePressed,
    );
  }
}

class NewSection extends StatelessWidget {
  final List<Product> products;
  final VoidCallback? onViewAllPressed;
  final Function(Product)? onProductTap;
  final Function(Product)? onFavoritePressed;

  const NewSection({
    super.key,
    required this.products,
    this.onViewAllPressed,
    this.onProductTap,
    this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return ProductSection(
      title: "New",
      subtitle: "You've never seen it before!",
      products: products.where((product) => product.isNew).toList(),
      onViewAllPressed: onViewAllPressed,
      onProductTap: onProductTap,
      onFavoritePressed: onFavoritePressed,
    );
  }
}

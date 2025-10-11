import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_images.dart';
import '../widgets/size_color_selector.dart';
import '../widgets/product_info.dart';
import '../widgets/product_description.dart';
import '../widgets/expandable_sections.dart';
import '../widgets/related_products.dart';
import '../widgets/add_to_cart.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product? product;

  const ProductDetailScreen({Key? key, this.product}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String selectedSize = 'Size';
  String selectedColor = 'Black';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Scrollable content
          Expanded(
            child: Container(
              color: Color(0xFFFFFFFF),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Images (now includes status bar and app bar)
                    ProductImages(),

                    // Size and Color Selector
                    SizeColorSelector(
                      selectedSize: selectedSize,
                      selectedColor: selectedColor,
                      onSizeChanged: (size) {
                        setState(() {
                          selectedSize = size;
                        });
                      },
                      onColorChanged: (color) {
                        setState(() {
                          selectedColor = color;
                        });
                      },
                    ),

                    // Product Info (Brand, Name, Price, Rating)
                    ProductInfo(),

                    // Product Description
                    ProductDescription(),

                    // Expandable Sections (Item details, Shipping info, Support)
                    ExpandableSections(),

                    // Related Products
                    RelatedProducts(),

                    // Bottom spacing to prevent content from being hidden behind the button
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ),

          // Fixed Add to Cart Button at bottom (no padding)
          AddToCart(onAddToCart: _onAddToCart),
        ],
      ),
    );
  }

  void _onAddToCart() {
    // Add product to cart logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Product added to cart!'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

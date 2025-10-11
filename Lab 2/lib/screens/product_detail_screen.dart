import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/status_bar.dart';
import '../widgets/app_bar.dart' as custom;
import '../widgets/product_images.dart';
import '../widgets/size_color_selector.dart';
import '../widgets/product_info.dart';
import '../widgets/product_description.dart';
import '../widgets/expandable_sections.dart';
import '../widgets/related_products.dart';
import '../widgets/add_to_cart.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product? product;

  const ProductDetailScreen({Key? key, this.product})
    : super(key: key);

  @override
  State<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState
    extends State<ProductDetailScreen> {
  String selectedSize = 'Size';
  String selectedColor = 'Black';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  color: Color(0xFFF9F9F9),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Status Bar with shadow
                        StatusBar(),

                        // App Bar with back button and title
                        custom.CustomAppBar(
                          title: "Short dress",
                          onBackPressed: () => Navigator.pop(context),
                        ),

                        // Product Images
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

                        // Add to Cart Button (embedded in description section)
                        AddToCart(onAddToCart: _onAddToCart),

                        // Expandable Sections (Item details, Shipping info, Support)
                        ExpandableSections(),

                        // Related Products
                        RelatedProducts(),

                        // Bottom spacing
                        SizedBox(height: 101),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onAddToCart() {
    print('Add to cart pressed');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Product added to cart!'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

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

  const ProductDetailScreen({super.key, this.product});

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
          Expanded(
            child: Container(
              color: Color(0xFFFFFFFF),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductImages(),

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

                    ProductInfo(),

                    ProductDescription(),

                    ExpandableSections(),

                    RelatedProducts(),

                    SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ),

          AddToCart(onAddToCart: _onAddToCart),
        ],
      ),
    );
  }

  void _onAddToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Product added to cart!'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

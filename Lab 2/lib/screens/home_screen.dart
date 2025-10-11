import 'package:flutter/material.dart';
import '../widgets/hero_section.dart';
import '../widgets/product_section.dart';
import '../models/product.dart';
import '../data/sample_products.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = SampleProducts.allProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            StreetClothesHeroSection(),

            SizedBox(height: 20),

            // Sales Section
            SalesSection(
              products: products,
              onViewAllPressed: () => _onViewAllPressed('Sale'),
              onProductTap: _onProductTap,
              onFavoritePressed: _onFavoritePressed,
            ),

            SizedBox(height: 20),

            // New Section
            NewSection(
              products: products,
              onViewAllPressed: () => _onViewAllPressed('New'),
              onProductTap: _onProductTap,
              onFavoritePressed: _onFavoritePressed,
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _onViewAllPressed(String section) {
    print('View all pressed for $section section');
    // Navigate to category page or show all products
    // Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(section: section)));
  }

  void _onProductTap(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(product: product),
      ),
    );
  }

  void _onFavoritePressed(Product product) {
    setState(() {
      // Find the product in the list and toggle favorite status
      final index = products.indexWhere((p) => p.id == product.id);
      if (index != -1) {
        products[index] = products[index].copyWith(
          isFavorite: !products[index].isFavorite,
        );
      }
    });

    print(
      'Favorite toggled for: ${product.itemName}, isFavorite: ${!product.isFavorite}',
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/hero_section.dart';
import '../widgets/product_section.dart';
import '../widgets/custom_status_bar.dart';

import '../models/product.dart';
import '../data/sample_products.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = SampleProducts.allProducts;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StreetClothesHeroSection(),

            SalesSection(
              products: products,
              onViewAllPressed: () => _onViewAllPressed('Sale'),
              onProductTap: _onProductTap,
              onFavoritePressed: _onFavoritePressed,
            ),

            NewSection(
              products: products,
              onViewAllPressed: () => _onViewAllPressed('New'),
              onProductTap: _onProductTap,
              onFavoritePressed: _onFavoritePressed,
            ),
          ],
        ),
      ),
    );
  }

  void _onViewAllPressed(String section) {
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

    // Favorite status updated successfully
  }
}

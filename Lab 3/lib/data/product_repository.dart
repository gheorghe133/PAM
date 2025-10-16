import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import '../models/product.dart';

class ProductRepository {
  static const String _jsonPath = 'assests/products.json';

  static const Duration _loadDelay = Duration(milliseconds: 1500);

  Future<List<Product>> loadProducts() async {
    try {
      await Future.delayed(_loadDelay);

      final String jsonString = await rootBundle.loadString(_jsonPath);

      final Map<String, dynamic> jsonData = json.decode(jsonString);

      final List<dynamic> productsJson = jsonData['products'] as List<dynamic>;

      final List<Product> products = productsJson
          .map(
            (productJson) =>
                Product.fromJson(productJson as Map<String, dynamic>),
          )
          .toList();

      return products;
    } catch (e) {
      throw ProductLoadException('Failed to load products: $e');
    }
  }

  Future<Product> updateProduct(Product product) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return product;
  }
}

class ProductLoadException implements Exception {
  final String message;

  const ProductLoadException(this.message);

  @override
  String toString() => 'ProductLoadException: $message';
}

import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import '../models/product.dart';

class ProductRepository {
  static const String _jsonPath = 'assests/products.json';
  
  // Simulate network delay for realistic async behavior
  static const Duration _loadDelay = Duration(milliseconds: 1500);
  
  /// Loads products from JSON file asynchronously
  Future<List<Product>> loadProducts() async {
    try {
      // Simulate network delay
      await Future.delayed(_loadDelay);
      
      // Load JSON string from assets
      final String jsonString = await rootBundle.loadString(_jsonPath);
      
      // Parse JSON
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      
      // Extract products array
      final List<dynamic> productsJson = jsonData['products'] as List<dynamic>;
      
      // Convert to Product objects
      final List<Product> products = productsJson
          .map((productJson) => Product.fromJson(productJson as Map<String, dynamic>))
          .toList();
      
      return products;
    } catch (e) {
      throw ProductLoadException('Failed to load products: $e');
    }
  }
  
  /// Loads products with additional filtering options
  Future<List<Product>> loadProductsByCategory({
    bool? isNew,
    bool? isOnSale,
    bool? isFavorite,
  }) async {
    final allProducts = await loadProducts();
    
    return allProducts.where((product) {
      if (isNew != null && product.isNew != isNew) return false;
      if (isOnSale != null && product.isOnSale != isOnSale) return false;
      if (isFavorite != null && product.isFavorite != isFavorite) return false;
      return true;
    }).toList();
  }
  
  /// Simulates updating a product (e.g., toggling favorite status)
  Future<Product> updateProduct(Product product) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // In a real app, this would make an API call
    // For now, we just return the updated product
    return product;
  }
  
  /// Simulates searching products by name or brand
  Future<List<Product>> searchProducts(String query) async {
    final allProducts = await loadProducts();
    
    if (query.isEmpty) return allProducts;
    
    final lowercaseQuery = query.toLowerCase();
    
    return allProducts.where((product) {
      return product.itemName.toLowerCase().contains(lowercaseQuery) ||
             product.brandName.toLowerCase().contains(lowercaseQuery);
    }).toList();
  }
}

/// Custom exception for product loading errors
class ProductLoadException implements Exception {
  final String message;
  
  const ProductLoadException(this.message);
  
  @override
  String toString() => 'ProductLoadException: $message';
}

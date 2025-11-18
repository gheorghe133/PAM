import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/feed_response_model.dart';
import '../models/product_detail_model.dart';

/// Remote data source for fetching data from API
class RemoteDataSource {
  final http.Client client;
  static const String baseUrl = 'https://test-api-jlbn.onrender.com/v3';

  RemoteDataSource({http.Client? client}) : client = client ?? http.Client();

  /// Fetch feed data from API
  Future<FeedResponseModel> getFeed() async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/feed'),
        headers: const {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        return FeedResponseModel.fromJson(jsonData);
      } else {
        throw RemoteDataSourceException(
          'Failed to load feed: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (e is RemoteDataSourceException) rethrow;
      throw RemoteDataSourceException('Failed to load feed: $e');
    }
  }

  /// Fetch product details from API
  Future<ProductDetailResponseModel> getProductDetails(String productId) async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/feed/details'),
        headers: const {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        return ProductDetailResponseModel.fromJson(jsonData);
      } else {
        throw RemoteDataSourceException(
          'Failed to load product details: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (e is RemoteDataSourceException) rethrow;
      throw RemoteDataSourceException('Failed to load product details: $e');
    }
  }
}

/// Exception for remote data source errors
class RemoteDataSourceException implements Exception {
  final String message;

  const RemoteDataSourceException(this.message);

  @override
  String toString() => 'RemoteDataSourceException: $message';
}

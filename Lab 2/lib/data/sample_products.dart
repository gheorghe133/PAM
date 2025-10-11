import '../models/product.dart';

class SampleProducts {
  static List<Product> get allProducts => [
    // Sale Products
    Product(
      id: '1',
      imagePath: 'assests/sales_image_1.png',
      saleLabel: '-20%',
      rating: 5,
      reviewCount: 10,
      brandName: 'Dorothy Perkins',
      itemName: 'Evening Dress',
      oldPrice: 15,
      newPrice: 12,
      isNew: false,
      isFavorite: false,
    ),
    Product(
      id: '2',
      imagePath: 'assests/sales_image_2.png',
      saleLabel: '-15%',
      rating: 5,
      reviewCount: 10,
      brandName: 'Sitlly',
      itemName: 'Sport Dress',
      oldPrice: 22,
      newPrice: 19,
      isNew: false,
      isFavorite: true,
    ),
    Product(
      id: '3',
      imagePath: 'assests/sales_image_3.png',
      saleLabel: '-30%',
      rating: 4,
      reviewCount: 25,
      brandName: 'OVS',
      itemName: 'Blouse',
      oldPrice: 30,
      newPrice: 21,
      isNew: false,
      isFavorite: false,
    ),

    // New Products
    Product(
      id: '4',
      imagePath: 'assests/sales_image_1.png',
      rating: 5,
      reviewCount: 3,
      brandName: 'Nike',
      itemName: 'Sportswear T-Shirt',
      oldPrice: 25,
      newPrice: 25,
      isNew: true,
      isFavorite: false,
    ),
    Product(
      id: '5',
      imagePath: 'assests/sales_image_2.png',
      rating: 4,
      reviewCount: 8,
      brandName: 'Adidas',
      itemName: 'Running Shoes',
      oldPrice: 89,
      newPrice: 89,
      isNew: true,
      isFavorite: true,
    ),
    Product(
      id: '6',
      imagePath: 'assests/sales_image_3.png',
      rating: 5,
      reviewCount: 15,
      brandName: 'Zara',
      itemName: 'Summer Jacket',
      oldPrice: 45,
      newPrice: 45,
      isNew: true,
      isFavorite: false,
    ),

    // Regular Products
    Product(
      id: '7',
      imagePath: 'assests/sales_image_1.png',
      rating: 4,
      reviewCount: 20,
      brandName: 'H&M',
      itemName: 'Casual Jeans',
      oldPrice: 35,
      newPrice: 35,
      isNew: false,
      isFavorite: false,
    ),
    Product(
      id: '8',
      imagePath: 'assests/sales_image_2.png',
      rating: 5,
      reviewCount: 12,
      brandName: 'Mango',
      itemName: 'Office Shirt',
      oldPrice: 28,
      newPrice: 28,
      isNew: false,
      isFavorite: true,
    ),
  ];

  static List<Product> get saleProducts =>
      allProducts.where((product) => product.isOnSale).toList();

  static List<Product> get newProducts =>
      allProducts.where((product) => product.isNew).toList();

  static List<Product> get regularProducts => allProducts
      .where((product) => !product.isOnSale && !product.isNew)
      .toList();

  static List<Product> get favoriteProducts =>
      allProducts.where((product) => product.isFavorite).toList();
}

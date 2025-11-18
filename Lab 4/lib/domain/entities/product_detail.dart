import 'package:equatable/equatable.dart';

class ProductColor extends Equatable {
  final String name;
  final String hex;
  final List<String> images;

  const ProductColor({
    required this.name,
    required this.hex,
    required this.images,
  });

  @override
  List<Object?> get props => [name, hex, images];
}

class ShippingInfo extends Equatable {
  final String delivery;
  final String returns;

  const ShippingInfo({required this.delivery, required this.returns});

  @override
  List<Object?> get props => [delivery, returns];
}

class SupportInfo extends Equatable {
  final String contactEmail;
  final String faqUrl;

  const SupportInfo({required this.contactEmail, required this.faqUrl});

  @override
  List<Object?> get props => [contactEmail, faqUrl];
}

class ProductActions extends Equatable {
  final bool addToCart;
  final bool addToWishlist;
  final bool share;

  const ProductActions({
    required this.addToCart,
    required this.addToWishlist,
    required this.share,
  });

  @override
  List<Object?> get props => [addToCart, addToWishlist, share];
}

class RelatedProduct extends Equatable {
  final String id;
  final String title;
  final String brand;
  final double price;
  final double? oldPrice;
  final String currency;
  final String? discount;
  final double rating;
  final int reviewsCount;
  final String image;

  const RelatedProduct({
    required this.id,
    required this.title,
    required this.brand,
    required this.price,
    this.oldPrice,
    required this.currency,
    this.discount,
    required this.rating,
    required this.reviewsCount,
    required this.image,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    brand,
    price,
    oldPrice,
    currency,
    discount,
    rating,
    reviewsCount,
    image,
  ];
}

class ProductDetail extends Equatable {
  final String id;
  final String title;
  final String brand;
  final String description;
  final double price;
  final String currency;
  final double rating;
  final int reviewsCount;
  final List<ProductColor> colors;
  final List<String> sizes;
  final ShippingInfo shippingInfo;
  final SupportInfo support;
  final ProductActions actions;
  final List<RelatedProduct> relatedProducts;

  const ProductDetail({
    required this.id,
    required this.title,
    required this.brand,
    required this.description,
    required this.price,
    required this.currency,
    required this.rating,
    required this.reviewsCount,
    required this.colors,
    required this.sizes,
    required this.shippingInfo,
    required this.support,
    required this.actions,
    required this.relatedProducts,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    brand,
    description,
    price,
    currency,
    rating,
    reviewsCount,
    colors,
    sizes,
    shippingInfo,
    support,
    actions,
    relatedProducts,
  ];
}

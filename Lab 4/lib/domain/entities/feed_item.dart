import 'package:equatable/equatable.dart';

class FeedItem extends Equatable {
  final int id;
  final String brand;
  final String name;
  final String image;
  final double price;
  final double? oldPrice;
  final int? discount;
  final double rating;
  final int reviews;
  final bool isFavorite;
  final bool isNew;

  const FeedItem({
    required this.id,
    required this.brand,
    required this.name,
    required this.image,
    required this.price,
    this.oldPrice,
    this.discount,
    required this.rating,
    required this.reviews,
    required this.isFavorite,
    this.isNew = false,
  });

  FeedItem copyWith({
    int? id,
    String? brand,
    String? name,
    String? image,
    double? price,
    double? oldPrice,
    int? discount,
    double? rating,
    int? reviews,
    bool? isFavorite,
    bool? isNew,
  }) {
    return FeedItem(
      id: id ?? this.id,
      brand: brand ?? this.brand,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      discount: discount ?? this.discount,
      rating: rating ?? this.rating,
      reviews: reviews ?? this.reviews,
      isFavorite: isFavorite ?? this.isFavorite,
      isNew: isNew ?? this.isNew,
    );
  }

  @override
  List<Object?> get props => [
    id,
    brand,
    name,
    image,
    price,
    oldPrice,
    discount,
    rating,
    reviews,
    isFavorite,
    isNew,
  ];
}

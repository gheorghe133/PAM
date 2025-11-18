import 'package:equatable/equatable.dart';
import '../../domain/entities/feed_header.dart';
import '../../domain/entities/feed_section.dart';
import '../../domain/entities/feed_item.dart';
import '../../domain/entities/product_detail.dart';

abstract class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object?> get props => [];
}

class FeedInitial extends FeedState {
  const FeedInitial();
}

class FeedLoading extends FeedState {
  const FeedLoading();
}

class FeedLoaded extends FeedState {
  final FeedHeader header;
  final List<FeedSection> sections;

  const FeedLoaded({required this.header, required this.sections});

  @override
  List<Object?> get props => [header, sections];

  List<FeedItem> get allItems {
    return sections.expand((section) => section.items).toList();
  }

  List<FeedItem> get saleItems {
    final saleSection = sections.firstWhere(
      (section) => section.title.toLowerCase() == 'sale',
      orElse: () => const FeedSection(title: '', subtitle: '', items: []),
    );
    return saleSection.items;
  }

  List<FeedItem> get newItems {
    final newSection = sections.firstWhere(
      (section) => section.title.toLowerCase() == 'new',
      orElse: () => const FeedSection(title: '', subtitle: '', items: []),
    );
    return newSection.items;
  }

  FeedLoaded copyWith({FeedHeader? header, List<FeedSection>? sections}) {
    return FeedLoaded(
      header: header ?? this.header,
      sections: sections ?? this.sections,
    );
  }
}

class ProductDetailLoaded extends FeedState {
  final ProductDetail productDetail;
  final FeedHeader? header;
  final List<FeedSection>? sections;

  const ProductDetailLoaded({
    required this.productDetail,
    this.header,
    this.sections,
  });

  @override
  List<Object?> get props => [productDetail, header, sections];
}

class FeedError extends FeedState {
  final String message;

  const FeedError(this.message);

  @override
  List<Object?> get props => [message];
}

class FeedUpdating extends FeedState {
  final int productId;
  final FeedHeader header;
  final List<FeedSection> sections;

  const FeedUpdating({
    required this.productId,
    required this.header,
    required this.sections,
  });

  @override
  List<Object?> get props => [productId, header, sections];
}

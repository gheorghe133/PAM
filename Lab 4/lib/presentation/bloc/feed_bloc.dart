import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/feed_repository.dart';
import '../../domain/entities/feed_section.dart';
import 'feed_event.dart';
import 'feed_state.dart';

/// BLoC for managing feed state
/// This is part of the Presentation layer
class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final FeedRepository _repository;

  FeedBloc({required FeedRepository repository})
      : _repository = repository,
        super(const FeedInitial()) {
    on<LoadFeed>(_onLoadFeed);
    on<RefreshFeed>(_onRefreshFeed);
    on<ToggleFeedItemFavorite>(_onToggleFavorite);
    on<LoadProductDetail>(_onLoadProductDetail);
  }

  Future<void> _onLoadFeed(
    LoadFeed event,
    Emitter<FeedState> emit,
  ) async {
    emit(const FeedLoading());

    try {
      final result = await _repository.getFeed();
      emit(FeedLoaded(
        header: result.header,
        sections: result.sections,
      ));
    } catch (e) {
      emit(FeedError(e.toString()));
    }
  }

  Future<void> _onRefreshFeed(
    RefreshFeed event,
    Emitter<FeedState> emit,
  ) async {
    if (state is FeedLoaded) {
      final currentState = state as FeedLoaded;
      emit(const FeedLoading());

      try {
        final result = await _repository.getFeed();
        emit(FeedLoaded(
          header: result.header,
          sections: result.sections,
        ));
      } catch (e) {
        emit(currentState);
        emit(FeedError(e.toString()));
      }
    } else {
      add(const LoadFeed());
    }
  }

  Future<void> _onToggleFavorite(
    ToggleFeedItemFavorite event,
    Emitter<FeedState> emit,
  ) async {
    if (state is! FeedLoaded) return;

    final currentState = state as FeedLoaded;

    emit(FeedUpdating(
      productId: event.productId,
      header: currentState.header,
      sections: currentState.sections,
    ));

    try {
      // Find the item and toggle its favorite status
      final updatedSections = currentState.sections.map((section) {
        final updatedItems = section.items.map((item) {
          if (item.id == event.productId) {
            final newFavoriteStatus = !item.isFavorite;
            // Update repository
            _repository.toggleFavorite(event.productId, newFavoriteStatus);
            return item.copyWith(isFavorite: newFavoriteStatus);
          }
          return item;
        }).toList();

        return FeedSection(
          title: section.title,
          subtitle: section.subtitle,
          items: updatedItems,
        );
      }).toList();

      emit(currentState.copyWith(sections: updatedSections));
    } catch (e) {
      emit(currentState);
      emit(FeedError('Failed to update favorite: $e'));
    }
  }

  Future<void> _onLoadProductDetail(
    LoadProductDetail event,
    Emitter<FeedState> emit,
  ) async {
    try {
      // Keep the current feed state if available
      FeedLoaded? currentFeedState;
      if (state is FeedLoaded) {
        currentFeedState = state as FeedLoaded;
      } else if (state is ProductDetailLoaded) {
        final detailState = state as ProductDetailLoaded;
        if (detailState.header != null && detailState.sections != null) {
          currentFeedState = FeedLoaded(
            header: detailState.header!,
            sections: detailState.sections!,
          );
        }
      }

      if (currentFeedState == null) {
        emit(const FeedLoading());
      }

      final productDetail = await _repository.getProductDetails(event.productId);

      emit(ProductDetailLoaded(
        productDetail: productDetail,
        header: currentFeedState?.header,
        sections: currentFeedState?.sections,
      ));
    } catch (e) {
      emit(FeedError('Failed to load product details: $e'));
    }
  }
}

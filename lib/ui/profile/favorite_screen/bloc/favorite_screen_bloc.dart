// ignore_for_file: avoid-unused-parameters
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecom_app/data/models/product.dart';
import 'package:ecom_app/domain/repositories/product/product_repository.dart';
import 'package:equatable/equatable.dart';

part 'favorite_screen_event.dart';
part 'favorite_screen_state.dart';

class FavoriteScreenBloc
    extends Bloc<FavoriteScreenEvent, FavoriteScreenState> {
  final ProductRepository productRepository;
  StreamSubscription? productSubscription;
  FavoriteScreenBloc({
    required this.productRepository,
  }) : super(FavoriteScreenLoading()) {
    on<FavoriteScreenLoadProduct>(_onFavoriteScreenLoadProduct);
    on<FavoriteScreenUpdateProduct>(_onFavoriteScreenUpdateProduct);
    on<FavoriteScreenProductFavoriteUpdate>(
      _onFavoriteScreenProductFavoriteUpdate,
    );
  }

  void _onFavoriteScreenLoadProduct(
    FavoriteScreenLoadProduct event,
    Emitter<FavoriteScreenState> emit,
  ) {
    productSubscription?.cancel();
    productSubscription = productRepository.getAllFavoriteProducts().listen(
          (
            products,
          ) =>
              add(
            FavoriteScreenUpdateProduct(products),
          ),
        );
  }

  void _onFavoriteScreenUpdateProduct(
    FavoriteScreenUpdateProduct event,
    Emitter<FavoriteScreenState> emit,
  ) {
    emit(FavoriteScreenLoaded(products: event.products));
  }

  void _onFavoriteScreenProductFavoriteUpdate(
    FavoriteScreenProductFavoriteUpdate event,
    Emitter<FavoriteScreenState> emit,
  ) {
    productRepository.updateProductFavorite(event.product, event.isFavorite);
  }

  @override
  Future<void> close() {
    productSubscription?.cancel();

    return super.close();
  }
}

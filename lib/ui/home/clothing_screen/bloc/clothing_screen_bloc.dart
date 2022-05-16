import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecom_app/data/models/product.dart';
import 'package:ecom_app/domain/repositories/product/product_repository.dart';
import 'package:equatable/equatable.dart';

part 'clothing_screen_event.dart';
part 'clothing_screen_state.dart';

class ClothingScreenBloc
    extends Bloc<ClothingScreenEvent, ClothingScreenState> {
  final ProductRepository productRepository;
  StreamSubscription? proudctSubscription;
  ClothingScreenBloc({
    required this.productRepository,
  }) : super(ClothingScreenLoading()) {
    on<ClothingScreenLoadProduct>(_onClothingLoadProduct);
    on<ClothingScreenUpdateProduct>(_onClothingUpdateProduct);
    on<ClothingProductFavoriteUpdate>(_onClothingProductFavoriteUpdate);
  }

  void _onClothingLoadProduct(
    ClothingScreenLoadProduct event,
    Emitter<ClothingScreenState> emit,
  ) {
    proudctSubscription?.cancel();
    proudctSubscription = productRepository.getAllClothingProducts().listen(
          (
            products,
          ) =>
              add(
            ClothingScreenUpdateProduct(products),
          ),
        );
  }

  void _onClothingUpdateProduct(
    ClothingScreenUpdateProduct event,
    Emitter<ClothingScreenState> emit,
  ) {
    {
      emit(ClothingScreenLoaded(products: event.products));
    }
  }

  void _onClothingProductFavoriteUpdate(
    ClothingProductFavoriteUpdate event,
    Emitter<ClothingScreenState> emit,
  ) {
    productRepository.updateProductFavorite(event.product, event.isFavorite);
  }
}

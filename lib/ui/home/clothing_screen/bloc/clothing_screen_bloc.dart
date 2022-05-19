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
    on<SortByDateProduct>(_onSortByDateProduct);
    on<SortHighToLow>(_onSortHighToLow);
    on<SortLowToHigh>(_onSortLowToHigh);
    on<FiltePriceSelect>(_onFilterPriceSelect);
  }
  @override
  Future<void> close() {
    proudctSubscription?.cancel();

    return super.close();
  }

  void _onClothingLoadProduct(
    ClothingScreenLoadProduct event,
    Emitter<ClothingScreenState> emit,
  ) {
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

  void _onSortByDateProduct(
    SortByDateProduct event,
    Emitter<ClothingScreenState> emit,
  ) {
    productRepository.sortByDateProducts().listen(
          (val) => add(ClothingScreenUpdateProduct(val)),
        );
  }

  void _onSortHighToLow(
    SortHighToLow event,
    Emitter<ClothingScreenState> emit,
  ) {
    productRepository.sortPriceHightToLow().listen(
          (val) => add(ClothingScreenUpdateProduct(val)),
        );
  }

  void _onSortLowToHigh(
    SortLowToHigh event,
    Emitter<ClothingScreenState> emit,
  ) {
    productRepository.sortPriceLowToHigh().listen(
          (val) => add(ClothingScreenUpdateProduct(val)),
        );
  }

  void _onFilterPriceSelect(
    FiltePriceSelect event,
    Emitter<ClothingScreenState> emit,
  ) {
    productRepository
        .filterPriceSelect(event.startPrice, event.endPrice)
        .listen((val) => add(ClothingScreenUpdateProduct(val)));
  }
}

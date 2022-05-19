part of 'clothing_screen_bloc.dart';

abstract class ClothingScreenEvent extends Equatable {
  const ClothingScreenEvent();

  @override
  List<Object> get props => [];
}

class ClothingScreenLoadProduct extends ClothingScreenEvent {}

class ClothingScreenUpdateProduct extends ClothingScreenEvent {
  final List<Product> products;
  // final Product product;
  ClothingScreenUpdateProduct(
    this.products,
    // this.product
  );

  @override
  List<Object> get props => [
        products,
      ];
}

class ClothingProductFavoriteUpdate extends ClothingScreenEvent {
  final bool isFavorite;
  Product product;

  ClothingProductFavoriteUpdate(
    this.product,
    this.isFavorite,
  );

  @override
  List<Object> get props => [
        product,
      ];
}

class SortByDateProduct extends ClothingScreenEvent {}

class SortHighToLow extends ClothingScreenEvent {}

class SortLowToHigh extends ClothingScreenEvent {}

class FiltePriceSelect extends ClothingScreenEvent {
  final num startPrice;
  final num endPrice;

  FiltePriceSelect(this.startPrice, this.endPrice);

  @override
  List<Object> get props => [
        startPrice,
        endPrice,
      ];
}

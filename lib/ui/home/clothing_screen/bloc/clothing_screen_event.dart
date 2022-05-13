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

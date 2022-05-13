part of 'clothing_screen_bloc.dart';

abstract class ClothingScreenState extends Equatable {
  const ClothingScreenState();

  @override
  List<Object> get props => [];
}

class ClothingScreenLoading extends ClothingScreenState {}

class ClothingScreenLoaded extends ClothingScreenState {
  final List<Product> products;
  // final Product product;

  ClothingScreenLoaded(
      // this.product,
      {
    this.products = const <Product>[],
  });

  @override
  List<Object> get props => [
        products,
        // product,
      ];
}

class ClothingProductFavoriteUpdated extends ClothingScreenState {
  // final bool isFavorite;
  Product product;
  // final String productId;

  ClothingProductFavoriteUpdated(
    this.product,
    // this.isFavorite,
    // this.productId,
  );
  @override
  List<Object> get props => [
        product,
        // isFavorite,
        //  productId
      ];
}

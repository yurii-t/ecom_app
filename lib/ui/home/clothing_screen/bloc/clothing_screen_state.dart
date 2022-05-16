part of 'clothing_screen_bloc.dart';

abstract class ClothingScreenState extends Equatable {
  const ClothingScreenState();

  @override
  List<Object> get props => [];
}

class ClothingScreenLoading extends ClothingScreenState {}

class ClothingScreenLoaded extends ClothingScreenState {
  final List<Product> products;

  ClothingScreenLoaded({
    this.products = const <Product>[],
  });

  @override
  List<Object> get props => [
        products,
      ];
}

class ClothingProductFavoriteUpdated extends ClothingScreenState {
  Product product;

  ClothingProductFavoriteUpdated(
    this.product,
  );
  @override
  List<Object> get props => [
        product,
      ];
}

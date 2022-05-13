part of 'favorite_screen_bloc.dart';

abstract class FavoriteScreenState extends Equatable {
  const FavoriteScreenState();

  @override
  List<Object> get props => [];
}

class FavoriteScreenLoading extends FavoriteScreenState {}

class FavoriteScreenLoaded extends FavoriteScreenState {
  final List<Product> products;
  // final Product product;

  FavoriteScreenLoaded(
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

class FavoriteScreenProductFavoriteUpdated extends FavoriteScreenState {
  // final bool isFavorite;
  // Product product;
  final List<Product> products;
  // final String productId;

  FavoriteScreenProductFavoriteUpdated(
    this.products,
    // this.isFavorite,
    // this.productId,
  );
  @override
  List<Object> get props => [
        products,
        // isFavorite,
        //  productId
      ];
}

part of 'favorite_screen_bloc.dart';

abstract class FavoriteScreenEvent extends Equatable {
  const FavoriteScreenEvent();

  @override
  List<Object> get props => [];
}

class FavoriteScreenLoadProduct extends FavoriteScreenEvent {}

class FavoriteScreenUpdateProduct extends FavoriteScreenEvent {
  final List<Product> products;

  const FavoriteScreenUpdateProduct(
    this.products,
  );

  @override
  List<Object> get props => [
        products,
      ];
}

class FavoriteScreenProductFavoriteUpdate extends FavoriteScreenEvent {
  final bool isFavorite;
  final Product product;
  final List<Product> products;

  const FavoriteScreenProductFavoriteUpdate(
    this.product,
    this.isFavorite,
    this.products,
  );

  @override
  List<Object> get props => [
        isFavorite,
        product,
        products,
      ];
}

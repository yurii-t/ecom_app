part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();

  @override
  List<Object> get props => [];
}

class HomeScreenLoadProduct extends HomeScreenEvent {}

class HomeScreenUpdateProduct extends HomeScreenEvent {
  final List<Product> products;

  const HomeScreenUpdateProduct(
    this.products,
  );

  @override
  List<Object> get props => [
        products,
      ];
}

class HomeScreenProductFavoriteUpdate extends HomeScreenEvent {
  final bool isFavorite;
  final Product product;

  const HomeScreenProductFavoriteUpdate(
    this.product,
    this.isFavorite,
  );

  @override
  List<Object> get props => [
        product,
      ];
}

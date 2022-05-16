part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();

  @override
  List<Object> get props => [];
}

class HomeScreenLoadProduct extends HomeScreenEvent {}

class HomeScreenUpdateProduct extends HomeScreenEvent {
  final List<Product> products;

  HomeScreenUpdateProduct(
    this.products,
  );

  @override
  List<Object> get props => [
        products,
      ];
}

class HomeScreenProductFavoriteUpdate extends HomeScreenEvent {
  final bool isFavorite;
  Product product;

  HomeScreenProductFavoriteUpdate(
    this.product,
    this.isFavorite,
  );

  @override
  List<Object> get props => [
        product,
      ];
}

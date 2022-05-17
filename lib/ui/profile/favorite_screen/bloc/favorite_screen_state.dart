part of 'favorite_screen_bloc.dart';

abstract class FavoriteScreenState extends Equatable {
  const FavoriteScreenState();

  @override
  List<Object> get props => [];
}

class FavoriteScreenLoading extends FavoriteScreenState {}

class FavoriteScreenLoaded extends FavoriteScreenState {
  final List<Product> products;

  FavoriteScreenLoaded({
    this.products = const <Product>[],
  });

  @override
  List<Object> get props => [
        products,
      ];
}

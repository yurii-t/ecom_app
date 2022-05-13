part of 'home_screen_bloc.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List<Object> get props => [];
}

class HomeScreenLoading extends HomeScreenState {}

class HomeScreenLoaded extends HomeScreenState {
  final List<Product> products;
  // final Product product;

  HomeScreenLoaded(
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

class HomeScreenProductFavoriteUpdated extends HomeScreenState {
  // final bool isFavorite;
  Product product;
  // final String productId;

  HomeScreenProductFavoriteUpdated(
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

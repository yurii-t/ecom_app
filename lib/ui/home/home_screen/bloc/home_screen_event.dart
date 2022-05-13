part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();

  @override
  List<Object> get props => [];
}

class HomeScreenLoadProduct extends HomeScreenEvent {}

class HomeScreenUpdateProduct extends HomeScreenEvent {
  final List<Product> products;
  // final Product product;
  HomeScreenUpdateProduct(
    this.products,
    // this.product
  );

  @override
  List<Object> get props => [
        products,
        // product
      ];
}

class HomeScreenProductFavoriteUpdate extends HomeScreenEvent {
  // Product product;
  final bool isFavorite;
  Product product;
  // String productId;

  HomeScreenProductFavoriteUpdate(
    this.product,
    this.isFavorite,
    //  this.productId
  );

  @override
  List<Object> get props => [
        product,
        // isFavorite,
        //  productId
      ];
}

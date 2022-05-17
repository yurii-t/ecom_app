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

  HomeScreenLoaded({
    this.products = const <Product>[],
  });

  @override
  List<Object> get props => [
        products,
      ];
}

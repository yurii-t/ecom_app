part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<Cart> cartItems;
  // final Cart? cartItem;

  const CartLoaded({this.cartItems = const <Cart>[]});

  @override
  List<Object> get props => [cartItems];
}

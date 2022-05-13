part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {}

class UpdateCart extends CartEvent {
  final List<Cart> cartItems;
  // final Product product;
  UpdateCart(
    this.cartItems,
    // this.product
  );

  @override
  List<Object> get props => [
        cartItems,
      ];
}

class AddProduct extends CartEvent {
  final Cart cartItem;

  const AddProduct(this.cartItem);

  @override
  List<Object> get props => [cartItem];
}

class RemoveProducts extends CartEvent {
  final Cart cartItem;

  const RemoveProducts(this.cartItem);

  @override
  List<Object> get props => [cartItem];
}

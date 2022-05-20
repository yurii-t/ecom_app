part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {}

class UpdateCart extends CartEvent {
  final List<Cart> cartItems;

  const UpdateCart(
    this.cartItems,
  );

  @override
  List<Object> get props => [
        cartItems,
      ];
}

class AddProduct extends CartEvent {
  final Cart cartItem;

  final String productId;

  const AddProduct(this.cartItem, this.productId);

  @override
  List<Object> get props => [cartItem, productId];
}

class RemoveProducts extends CartEvent {
  final List<Cart> cartItem;

  const RemoveProducts(this.cartItem);

  @override
  List<Object> get props => [cartItem];
}

class IncreaseQuantity extends CartEvent {
  final String productId;

  const IncreaseQuantity(this.productId);

  @override
  List<Object> get props => [productId];
}

class DecreaseQuantity extends CartEvent {
  final String productId;

  const DecreaseQuantity(this.productId);

  @override
  List<Object> get props => [productId];
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecom_app/data/models/cart.dart';
import 'package:ecom_app/data/models/product.dart';
import 'package:ecom_app/domain/repositories/cart/cart_repository.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;
  StreamSubscription? cartSubscription;

  CartBloc({required this.cartRepository}) : super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<UpdateCart>(_onUpdateCart);
    on<AddProduct>(_onAddProduct);
    on<RemoveProducts>(_onRemoveProducts);
    on<IncreaseQuantity>(_increaseQuantity);
    on<DecreaseQuantity>(_decreaseQuantity);
  }

  void _onLoadCart(
    LoadCart event,
    Emitter<CartState> emit,
  ) {
    cartSubscription?.cancel();
    cartSubscription = cartRepository.getAllCartItems().listen(
          (
            cartItems,
          ) =>
              add(
            UpdateCart(cartItems),
          ),
        );
  }

  void _onUpdateCart(
    UpdateCart event,
    Emitter<CartState> emit,
  ) {
    {
      emit(CartLoaded(cartItems: event.cartItems));
    }
  }

  void _onAddProduct(
    AddProduct event,
    Emitter<CartState> emit,
  ) {
    // productRepository.updateProductFavorite(event.product, event.isFavorite);
    cartRepository.addCartItem(event.cartItem, event.productId);
  }

  void _onRemoveProducts(
    RemoveProducts event,
    Emitter<CartState> emit,
  ) {
    cartRepository.deleteCartItems();
  }

  void _increaseQuantity(
    IncreaseQuantity event,
    Emitter<CartState> emit,
  ) {
    cartRepository.increaseQuantity(event.productId);
  }

  void _decreaseQuantity(
    DecreaseQuantity event,
    Emitter<CartState> emit,
  ) {
    cartRepository.decreaseQuantity(event.productId);
  }
}

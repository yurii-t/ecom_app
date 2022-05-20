import 'package:ecom_app/data/models/cart.dart';

abstract class BaseCartRepository {
  Stream<List<Cart>> getAllCartItems();
  Future<void> addCartItem(
    Cart cart,
    String productId,
  );
  Future<void> deleteCartItems();
  Future<void> increaseQuantity(
    String productId,
  );
  Future<void> decreaseQuantity(
    String productId,
  );
}

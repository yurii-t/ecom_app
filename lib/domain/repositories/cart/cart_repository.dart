import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/data/models/cart.dart';

import 'package:ecom_app/domain/repositories/cart/base_cart_repository.dart';

class CartRepository extends BaseCartRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<List<Cart>> getAllCartItems() {
    return _firebaseFirestore.collection('cart').snapshots().map((snapshot) {
      return snapshot.docs.map(Cart.fromSnapShot).toList();
    });
  }

  @override
  Future<void> addCartItem(
    Cart cart,
    String productId,
  ) {
    return _firebaseFirestore
        .collection('cart')
        .doc(productId)
        .set(cart.toDocument());
  }

  @override
  Future<void> deleteCartItems() {
    return _firebaseFirestore.collection('cart').get().then((value) {
      for (final item in value.docs) {
        item.reference.delete();
      }
    });
  }

  @override
  Future<void> increaseQuantity(
    String productId,
  ) {
    return _firebaseFirestore.collection('cart').doc(productId).update({
      'quantity': FieldValue.increment(1),
    });
  }

  @override
  Future<void> decreaseQuantity(
    String productId,
  ) {
    return _firebaseFirestore.collection('cart').doc(productId).update({
      'quantity': FieldValue.increment(-1),
    });
  }
}

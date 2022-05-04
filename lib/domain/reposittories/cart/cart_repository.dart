import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/data/models/cart.dart';
import 'package:ecom_app/domain/reposittories/cart/base_cart_repository.dart';

class CartRepository extends BaseCartRepository {
  final FirebaseFirestore _firebaseFirestore;

  CartRepository(this._firebaseFirestore);

  @override
  Stream<List<Cart>> getAllCartItems() {
    return _firebaseFirestore
        .collection('checkout')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Cart.fromSnapShot(doc)).toList();
    });
  }
}

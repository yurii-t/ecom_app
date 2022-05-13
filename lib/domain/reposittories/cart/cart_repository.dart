import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/data/models/cart.dart';
import 'package:ecom_app/data/models/product.dart';
import 'package:ecom_app/domain/reposittories/cart/base_cart_repository.dart';

class CartRepository extends BaseCartRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // CartRepository(this._firebaseFirestore);

  @override
  Stream<List<Cart>> getAllCartItems() {
    return _firebaseFirestore.collection('cart').snapshots().map((snapshot) {
      return snapshot.docs.map(Cart.fromSnapShot).toList();
      // return snapshot.docs.map((doc) => Cart.fromSnapShot(doc)).toList();
    });
  }

  Future<void> addCartItem(
    Cart cart,
    Product product,
  ) {
    //String name, num price,String imgUrl,int quantity, String colors,String sizes){
    return _firebaseFirestore
        .collection('cart')
        .doc(product.id)
        .set(cart.toDocument());
  }

  Future<void> deleteCartItems() {
    return _firebaseFirestore.collection('cart').get().then((value) {
      for (var item in value.docs) {
        item.reference.delete();
      }
    });
  }
}

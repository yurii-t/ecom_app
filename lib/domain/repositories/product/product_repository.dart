import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/data/models/product.dart';

import 'package:ecom_app/domain/repositories/product/base_product_repository.dart';
import 'package:firebase_core/firebase_core.dart';

class ProductRepository extends BaseProductRepository {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //ProductRepository(this._firebaseFirestore);

  @override
  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map(Product.fromSnapShot).toList();
      // return snapshot.docs.map((doc) => Product.fromSnapShot(doc)).toList();
    });
  }

  @override
  Future<void> updateProductFavorite(
    Product product,
    // String productId,
    bool isFavorite,
  ) {
    return _firebaseFirestore
        .collection('products')
        .doc(product.id)
        .update({'isFavorite': isFavorite});
  }

  @override
  Stream<List<Product>> getAllClothingProducts() {
    return _firebaseFirestore
        .collection('products')
        .where('category', isEqualTo: 'Clothing')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map(Product.fromSnapShot).toList();
    });
  }

  @override
  Stream<List<Product>> getAllFavoriteProducts() {
    return _firebaseFirestore
        .collection('products')
        .where('isFavorite', isEqualTo: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map(Product.fromSnapShot).toList();
    });
  }

  Future getProductsItem(
    Product product,
  ) {
    return _firebaseFirestore.collection('products').doc(product.id).get();
  }

  Stream<List<Product>> searchProducts(String query) {
    return _firebaseFirestore
        .collection('products')
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThanOrEqualTo: '$query\uf7ff')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map(Product.fromSnapShot).toList();
    });
  }
}
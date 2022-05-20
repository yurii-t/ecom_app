import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/data/models/product.dart';

import 'package:ecom_app/domain/repositories/product/base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map(Product.fromSnapShot).toList();
    });
  }

  @override
  Future<void> updateProductFavorite(
    Product product,
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

  @override
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

  @override
  Stream<List<Product>> sortByDateProducts() {
    return _firebaseFirestore
        .collection('products')
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map(Product.fromSnapShot).toList();
    });
  }

  @override
  Stream<List<Product>> sortPriceHightToLow() {
    return _firebaseFirestore
        .collection('products')
        .orderBy('price', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map(Product.fromSnapShot).toList();
    });
  }

  @override
  Stream<List<Product>> sortPriceLowToHigh() {
    return _firebaseFirestore
        .collection('products')
        .orderBy('price', descending: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map(Product.fromSnapShot).toList();
    });
  }

  @override
  Stream<List<Product>> filterPriceSelect(num startPrice, num endPrice) {
    return _firebaseFirestore
        .collection('products')
        .where('price', isGreaterThanOrEqualTo: startPrice)
        .where('price', isLessThanOrEqualTo: endPrice)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map(Product.fromSnapShot).toList();
    });
  }
}

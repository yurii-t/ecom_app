import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/data/models/filter.dart';
import 'package:ecom_app/data/models/product.dart';

import 'package:ecom_app/domain/repositories/product/base_product_repository.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';

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
        .orderBy('price', descending: true)
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

  Stream<List<Product>> getFilterProducts(
    Filter filter,
    String searchQuery,
  ) {
    final collection = _firebaseFirestore.collection('products');
    Query? query;

    if (filter.selectedBrandItem.isNotEmpty) {
      query = query == null
          ? collection.where(
              'brand',
              isEqualTo: filter.selectedBrandItem.first,
            )
          : query.where('brand', isEqualTo: filter.selectedBrandItem.first);
    }
    if (filter.selectedColor.value != 0) {
      query = query == null
          ? collection.where('color', isEqualTo: filter.selectedColor.value)
          : query.where('color', isEqualTo: filter.selectedColor.value);
    }
    if (filter.selectedSizeItems.isNotEmpty) {
      query = query == null
          ? collection.where('size', isEqualTo: filter.selectedSizeItems.first)
          : query.where('size', isEqualTo: filter.selectedSizeItems.first);
    }
    if (filter.selectedSortItem == LocaleKeys.price_low_to_high.tr()) {
      query = query == null
          ? collection.orderBy('price', descending: false)
          : query.orderBy('price', descending: false);
    } else if (filter.selectedSortItem == LocaleKeys.price_high_to_low.tr()) {
      query = query == null
          ? collection.orderBy('price', descending: true)
          : query.orderBy('price', descending: true);
    } else if (filter.selectedSortItem == LocaleKeys.new_text.tr()) {
      query = query == null
          ? collection.orderBy('date', descending: true)
          : query.orderBy('date', descending: true);
    }

    final snapshots =
        query == null ? collection.snapshots() : query.snapshots();

    return snapshots.map((snapshot) {
      return snapshot.docs
          .map(Product.fromSnapShot)
          .where((element) =>
              element.price >= filter.minValue &&
              element.price <= filter.maxValue &&
              element.name.toLowerCase().startsWith(searchQuery.toLowerCase()))
          .toList();
    });
  }
}

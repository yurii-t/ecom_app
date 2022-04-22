// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecom_app/data/models/product_model.dart';
// import 'package:ecom_app/domain/reposittories/product/base_product_repository.dart';
// import 'package:firebase_core/firebase_core.dart';

// class ProductRepository extends BaseProductRepository {
//   final FirebaseFirestore _firebaseFirestore;

//   ProductRepository(this._firebaseFirestore);

//   @override
//   Stream<List<ProductModel>> getAllProducts() {
//     return _firebaseFirestore
//         .collection('products')
//         .snapshots()
//         .map((snapshot) {
//       return snapshot.docs
//           .map((doc) => ProductModel.fromSnapShot(doc))
//           .toList();
//     });
//   }
// }

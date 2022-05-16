import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/data/models/check_out.dart';
import 'package:ecom_app/domain/repositories/check_out/base_check_out_repository.dart';

class CheckOutRepository extends BaseCheckOutRepository {
  final FirebaseFirestore _firebaseFirestore;

  CheckOutRepository(this._firebaseFirestore);

  @override
  Stream<List<CheckOut>> getAllCheckOutItems() {
    return _firebaseFirestore
        .collection('checkout')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map(CheckOut.fromSnapShot).toList();
      // return snapshot.docs.map((doc) => CheckOut.fromSnapShot(doc)).toList();
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/data/models/catalogue.dart';
import 'package:ecom_app/domain/repositories/catalogue/base_catalogue_repository.dart';

class CatalogueRepository extends BaseCatalogueRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // CatalogueRepository(this._firebaseFirestore);

  @override
  Stream<List<Catalogue>> getAllCatalogue() {
    return _firebaseFirestore
        .collection('Catalogue')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map(Catalogue.fromSnapShot).toList();
      // return snapshot.docs.map((doc) => Catalogue.fromSnapShot(doc)).toList();
    });
  }
}

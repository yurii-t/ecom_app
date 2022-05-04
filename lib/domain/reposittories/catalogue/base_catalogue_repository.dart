import 'package:ecom_app/data/models/catalogue.dart';

abstract class BaseCatalogueRepository {
  Stream<List<Catalogue>> getAllCatalogue();
}

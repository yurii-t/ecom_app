import 'package:ecom_app/data/models/product.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}

import 'package:ecom_app/data/models/cart.dart';

abstract class BaseCartRepository {
  Stream<List<Cart>> getAllCartItems();
}

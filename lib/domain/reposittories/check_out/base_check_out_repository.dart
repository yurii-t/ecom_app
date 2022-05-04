import 'package:ecom_app/data/models/check_out.dart';

abstract class BaseCheckOutRepository {
  Stream<List<CheckOut>> getAllCheckOutItems();
}

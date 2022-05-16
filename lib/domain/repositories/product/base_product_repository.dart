import 'package:ecom_app/data/models/product.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
  Future<void> updateProductFavorite(
    Product product,
    // String productId,
    bool isFavorite,
  );
  Stream<List<Product>> getAllClothingProducts();
  Stream<List<Product>> getAllFavoriteProducts();
}

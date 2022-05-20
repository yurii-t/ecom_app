import 'package:ecom_app/data/models/product.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
  Future<void> updateProductFavorite(
    Product product,
    bool isFavorite,
  );
  Stream<List<Product>> getAllClothingProducts();
  Stream<List<Product>> getAllFavoriteProducts();
  Stream<List<Product>> searchProducts(String query);
  Stream<List<Product>> sortByDateProducts();
  Stream<List<Product>> sortPriceHightToLow();
  Stream<List<Product>> sortPriceLowToHigh();
  Stream<List<Product>> filterPriceSelect(num startPrice, num endPrice);
}

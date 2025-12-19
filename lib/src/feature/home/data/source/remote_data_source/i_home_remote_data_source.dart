import 'package:shopper_app/src/feature/home/data/model/product_model.dart';

abstract interface class IHomeRemoteDataSource {
  Future<List<Product>?> getProducts();
  Future<bool> updateProduct(Product product);
}

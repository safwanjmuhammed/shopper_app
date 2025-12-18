import 'package:shopper_app/src/feature/home/data/model/product_model.dart';

abstract interface class IHomeRemoteDataSource {
  Future<ProductsResponse?> getProducts();
}

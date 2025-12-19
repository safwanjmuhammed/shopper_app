import 'package:shopper_app/src/feature/home/data/model/product_model.dart';
import 'package:shopper_app/src/feature/home/domain/entity/product_entity.dart';

abstract interface class IHomeRepository {
  Future<ProductEntity?> getProducts();
}

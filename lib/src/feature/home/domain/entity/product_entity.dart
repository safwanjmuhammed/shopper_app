import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopper_app/src/feature/home/data/model/product_model.dart';

final productEntityProvider =
    Provider.autoDispose<ProductEntity>((ref) => ProductEntity());

class ProductEntity {
  ProductEntity({this.products});
  List<Product>? products;
}

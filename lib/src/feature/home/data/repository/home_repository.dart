import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopper_app/src/core/service/dio_api_service/interface/api_service_interface.dart';
import 'package:shopper_app/src/feature/home/data/source/remote_data_source/home_remote_data_source.dart';
import 'package:shopper_app/src/feature/home/data/source/remote_data_source/i_home_remote_data_source.dart';
import 'package:shopper_app/src/feature/home/domain/entity/product_entity.dart';
import 'package:shopper_app/src/feature/home/domain/repository/i_home_repository.dart';

final homeRepositoryProvider = Provider.autoDispose<IHomeRepository>((ref) {
  final source = ref.read(homeRemoteDataSourceProvider);
  return HomeRepository(source: source);
});

class HomeRepository implements IHomeRepository {
  HomeRepository({required this.source});
  IHomeRemoteDataSource source;

  @override
  Future<ProductEntity?> getProducts() async {
    try {
      final response = await source.getProducts();
      return ProductEntity(products: response);
    } catch (e) {
      return null;
    }
  }
}

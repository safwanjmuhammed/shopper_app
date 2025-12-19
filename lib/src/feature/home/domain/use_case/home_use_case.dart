import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopper_app/src/feature/home/data/repository/home_repository.dart';
import 'package:shopper_app/src/feature/home/domain/entity/product_entity.dart';
import 'package:shopper_app/src/feature/home/domain/repository/i_home_repository.dart';

final homeUseCaseProvider = Provider.autoDispose<HomeUseCase>((ref) {
  return HomeUseCase(repository: ref.read(homeRepositoryProvider));
});

class HomeUseCase {
  final IHomeRepository repository;

  HomeUseCase({required this.repository});

  Future<ProductEntity?> getProducts() async {
    return await repository.getProducts();
  }
}

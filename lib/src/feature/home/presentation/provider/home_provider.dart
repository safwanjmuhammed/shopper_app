import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopper_app/src/feature/home/data/model/product_model.dart';
import 'package:shopper_app/src/feature/home/data/source/remote_data_source/home_remote_data_source.dart';
import 'package:shopper_app/src/feature/home/domain/use_case/home_use_case.dart';

import 'home_state.dart';

final homeProvider =
    AsyncNotifierProvider<HomeNotifier, HomeState>(HomeNotifier.new);

class HomeNotifier extends AsyncNotifier<HomeState> {
  @override
  Future<HomeState> build() async {
    final products = await loadProducts();
    return HomeState(products: products ?? []);
  }

  HomeUseCase get homeUseCase => ref.read(homeUseCaseProvider);

  Future<List<Product>?> loadProducts() async {
    state = const AsyncValue.loading();
    try {
      final productEntiy = await homeUseCase.getProducts();
      print('Products from ${productEntiy?.products}');
      return productEntiy?.products;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
    return null;
  }
}

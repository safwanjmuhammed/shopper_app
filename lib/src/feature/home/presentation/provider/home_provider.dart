import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopper_app/src/feature/home/data/model/product_model.dart';

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
      return productEntiy?.products;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
    return null;
  }

  void setSelectedImageIndex(int index) {
    final currentState = state.value;
    if (currentState == null) return;
    state = AsyncValue.data(state.value!.copyWith(selectedImageIndex: index));
  }

  void storeProduct(Product product) {
    final currentState = state.value;
    if (currentState == null) return;
    state = AsyncValue.data(state.value!.copyWith(product: product));
  }
}

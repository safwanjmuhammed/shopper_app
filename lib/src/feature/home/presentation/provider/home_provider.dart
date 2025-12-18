import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopper_app/src/feature/home/data/source/remote_data_source/home_remote_data_source.dart';

import 'home_state.dart';

final homeProvider =
    AsyncNotifierProvider<HomeNotifier, HomeState>(HomeNotifier.new);

class HomeNotifier extends AsyncNotifier<HomeState> {
  @override
  Future<HomeState> build() async {
    return const HomeState(products: []);
  }

  // Future<void> loadProducts() async {
  //   state = const AsyncValue.loading();
  //   try {
  //     // Simulate network delay
  //     await Future.delayed(const Duration(milliseconds: 500));

  //     final products = getHomeProducts();
  //     state = AsyncValue.data(HomeState(
  //       isLoading: false,
  //       products: products,
  //     ));
  //   } catch (e) {
  //     state = AsyncValue.data(HomeState(
  //       isLoading: false,
  //       errorMessage: e.toString(),
  //     ));
  //   }
  // }
}

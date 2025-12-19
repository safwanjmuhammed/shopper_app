import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopper_app/src/config/route/routes.dart';
import 'package:shopper_app/src/feature/home/data/model/product_model.dart';
import 'package:shopper_app/src/feature/home/presentation/screen/home_screen.dart';
import 'package:shopper_app/src/feature/home/presentation/utils/home_constants.dart';
import 'package:shopper_app/src/feature/home/presentation/screen/product_detail_screen.dart';

final routerProvider = Provider<AppRouter>((ref) => AppRouter());

class AppRouter {
  GoRouter goRouter = GoRouter(
    navigatorKey: _rootKey,
    initialLocation: '/home-screen',
    routes: [
      GoRoute(
        path: '/home-screen',
        name: Routes.home,
        parentNavigatorKey: _rootKey,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: '/product-screen',
        name: Routes.productDetails,
        parentNavigatorKey: _rootKey,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final product = extra?['product'] as Product;
          return ProductDetailScreen(product: product);
        },
      ),
    ],
  );

  static final _rootKey = GlobalKey<NavigatorState>(
    debugLabel: 'root_navigator_key',
  );

  static BuildContext? get context => _rootKey.currentContext;
}

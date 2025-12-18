import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopper_app/src/feature/home/data/source/remote_data_source/home_remote_data_source.dart';
import 'package:shopper_app/src/feature/home/presentation/provider/home_provider.dart';
import '../utils/home_constants.dart';
import '../widgets/home/home_app_bar_widget.dart';
import '../widgets/home/home_header_section.dart';
import '../widgets/home/product_grid_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = getHomeProducts();
    ref.read(homeRemoteDataSourceProvider).getProducts();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const HomeAppBarWidget(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HomeHeaderSection(),
                      const SizedBox(height: 24),
                      ProductGrid(products: products),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

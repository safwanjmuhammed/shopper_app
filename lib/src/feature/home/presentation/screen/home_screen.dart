import 'package:flutter/material.dart';
import '../utils/home_constants.dart';
import '../widgets/home_app_bar_widget.dart';
import '../widgets/home_header_section.dart';
import '../widgets/product_grid_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = getHomeProducts();

    return Scaffold(
      backgroundColor: HomeColors.background,
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

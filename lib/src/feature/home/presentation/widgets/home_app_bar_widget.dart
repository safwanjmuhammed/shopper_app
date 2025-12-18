import 'package:flutter/material.dart';
import '../utils/home_constants.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(
            Icons.menu,
            color: HomeColors.iconColor,
            size: 24,
          ),
          Icon(
            Icons.shopping_cart_outlined,
            color: HomeColors.iconColor,
            size: 24,
          ),
        ],
      ),
    );
  }
}

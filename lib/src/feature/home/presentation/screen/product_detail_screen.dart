import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopper_app/src/common/widgets/primary_button.dart';
import 'package:shopper_app/src/feature/home/data/model/product_model.dart';
import '../utils/home_constants.dart';
import '../widgets/product_detail_header.dart';

// Note : avoiding unwanted product detaials api call.
// we are using product model from home screen to avoid api call.
class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: HomeColors.purpleLight,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: PrimaryButton(
          text: 'ADD TO CART',
          icon: Icons.shopping_cart_outlined,
          onPressed: () {},
          backgroundColor: HomeColors.purpleDark,
          borderRadius: 16,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductDetailHeader(product: product),
            // Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          product.title ?? '',
                          style: GoogleFonts.outfit(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                            height: 1.1,
                          ),
                        ),
                      ),
                      // if (product.isSale)
                      //   Container(
                      //     margin: const EdgeInsets.only(top: 4, left: 8),
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 8, vertical: 4),
                      //     decoration: BoxDecoration(
                      //       color: HomeColors.pinkTag,
                      //       borderRadius: BorderRadius.circular(4),
                      //     ),
                      //     child: Text(
                      //       'Best Seller',
                      //       style: GoogleFonts.inter(
                      //         color: Colors.white,
                      //         fontSize: 10,
                      //         fontWeight: FontWeight.w600,
                      //       ),
                      //     ),
                      //   ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'About the item',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Tabs
                  Row(
                    children: [
                      _buildTab('Full Specification', true),
                      const SizedBox(width: 16),
                      _buildTab('Reviews', false),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Description
                  Text(
                    product.description ?? '',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: HomeColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Delivery Info
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.map_outlined,
                              color: Colors.black54),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Aghmashenebeli Ave 75',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: HomeColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '1 Item is in the way',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: HomeColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.chevron_right, color: Colors.grey),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? HomeColors.tabSelected : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          color: isSelected ? HomeColors.textPrimary : HomeColors.textSecondary,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}

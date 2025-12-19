import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopper_app/src/feature/home/data/model/product_model.dart';
import 'package:shopper_app/src/feature/home/presentation/provider/home_provider.dart';
import '../utils/home_constants.dart';

class ProductDetailHeader extends StatelessWidget {
  final Product? product;

  const ProductDetailHeader({
    super.key,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Stack(
        children: [
          ClipPath(
            clipper: HeaderCurveClipper(),
            child: Container(
              height: 420,
              width: double.infinity,
              color: HomeColors.productDetailBackground,
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // Fav Button
          const Positioned(
            top: 50,
            right: 20,
            child: Icon(
              Icons.favorite_border,
              size: 24,
              color: Colors.black,
            ),
          ),
          Consumer(builder: (context, ref, child) {
            final selectedImageIndex = ref.watch(homeProvider
                .select((value) => value.value?.selectedImageIndex));
            return Positioned(
              top: 100,
              right: 20,
              child: Column(
                children: List.generate(
                  product?.images?.length ?? 0,
                  (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GestureDetector(
                        onTap: () => ref
                            .read(homeProvider.notifier)
                            .setSelectedImageIndex(index),
                        child: _buildThumbnail(
                            Icons.headset,
                            selectedImageIndex == index,
                            product?.images?[index] ?? ''),
                      )),
                ),
              ),
            );
          }),
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'product_${product?.id}',
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: Center(
                      child: Image.network(
                        fit: BoxFit.cover,
                        product?.images?.first ?? '',
                        height: 150,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 24,
            child: Text(
              '\$ ${product?.price}',
              style: GoogleFonts.outfit(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: HomeColors.bluePrice,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThumbnail(IconData icon, bool isSelected, String imageUrl) {
    return Container(
      width: 55,
      height: 55,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFC4F0E2) : const Color(0xFFF2E6FF),
        borderRadius: BorderRadius.circular(12),
        border: isSelected ? Border.all(color: Colors.black, width: 2) : null,
      ),
      child: Image.network(
        imageUrl,
      ),
    );
  }
}

class HeaderCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    // s-curve
    path.quadraticBezierTo(
        size.width * 0.25, size.height, size.width * 0.5, size.height - 30);
    path.quadraticBezierTo(
        size.width * 0.75, size.height - 60, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

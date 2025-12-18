import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/home_constants.dart';

class ProductDetailHeader extends StatelessWidget {
  final HomeProduct product;

  const ProductDetailHeader({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Stack(
        children: [
          // Background & Curve
          ClipPath(
            clipper: HeaderCurveClipper(),
            child: Container(
              height: 420,
              width: double.infinity,
              color: HomeColors.productDetailBackground,
            ),
          ),
          // Back Button
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
          // Thumbnails
          Positioned(
            top: 100,
            right: 20,
            child: Column(
              children: [
                _buildThumbnail(Icons.headset, true),
                const SizedBox(height: 12),
                _buildThumbnail(Icons.headset_mic, false),
                const SizedBox(height: 12),
                _buildThumbnail(Icons.headphones, false),
              ],
            ),
          ),
          // Main Image
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: product.id,
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
                      child: Text(
                        product.image,
                        style: const TextStyle(fontSize: 140),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Price
          Positioned(
            bottom: 30,
            left: 24,
            child: Text(
              '\$ ${product.price.toStringAsFixed(2)}',
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

  Widget _buildThumbnail(IconData icon, bool isSelected) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFC4F0E2) : const Color(0xFFF2E6FF),
        borderRadius: BorderRadius.circular(12),
        border: isSelected ? Border.all(color: Colors.white, width: 2) : null,
      ),
      child: Icon(icon, size: 20, color: Colors.black87),
    );
  }
}

class HeaderCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    // S-curve like shape
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

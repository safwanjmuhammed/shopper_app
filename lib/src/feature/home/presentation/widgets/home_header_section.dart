import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/home_constants.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Discover our exclusive products',
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: HomeColors.textPrimary,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'In this marketplace, you will find various\ntechnics in the cheapest price',
          style: GoogleFonts.inter(
            fontSize: 14,
            color: HomeColors.textSecondary,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

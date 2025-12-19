// Custom TextField Widget
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopper_app/src/feature/home/presentation/utils/home_constants.dart';

class AppTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String? prefixText;

  const AppTextFiled({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.validator,
    this.keyboardType,
    this.maxLines = 1,
    this.prefixText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: HomeColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: GoogleFonts.inter(
            fontSize: 16,
            color: HomeColors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: hint,
            prefixText: prefixText,
            prefixStyle: GoogleFonts.inter(
              fontSize: 16,
              color: HomeColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
            hintStyle: GoogleFonts.inter(
              fontSize: 16,
              color: HomeColors.textSecondary.withOpacity(0.5),
            ),
            filled: true,
            fillColor: HomeColors.cardBackground,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: HomeColors.textSecondary.withOpacity(0.1),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: HomeColors.textSecondary.withOpacity(0.1),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: HomeColors.primary,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
            errorStyle: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}

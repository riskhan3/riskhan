import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// IndiKhan App Typography - Manrope Font
class AppTextStyles {
  AppTextStyles._();

  // Base text style with Manrope
  static final TextStyle _baseStyle = GoogleFonts.manrope();

  // Headings
  static TextStyle h1 = _baseStyle.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  static TextStyle h2 = _baseStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.3,
  );

  static TextStyle h3 = _baseStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle h4 = _baseStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Body Text
  static TextStyle bodyLarge = _baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static TextStyle body = _baseStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static TextStyle bodyMedium = _baseStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static TextStyle caption = _baseStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  static TextStyle small = _baseStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  // Button Text
  static TextStyle button = _baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle buttonSmall = _baseStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  // Light variants (for dark backgrounds)
  static TextStyle h1Light = h1.copyWith(color: Colors.white);
  static TextStyle h2Light = h2.copyWith(color: Colors.white);
  static TextStyle h3Light = h3.copyWith(color: Colors.white);
  static TextStyle bodyLight = body.copyWith(color: Colors.white);
  static TextStyle captionLight = caption.copyWith(
    color: Colors.white.withValues(alpha: 0.7),
  );
}

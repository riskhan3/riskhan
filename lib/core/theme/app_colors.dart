import 'package:flutter/material.dart';

/// IndiKhan App Color Palette - Soft Teal & Slate Theme
class AppColors {
  AppColors._();

  // Primary Colors (Soft Teal)
  static const Color primary = Color(0xFF0D968B);
  static const Color primaryLight = Color(0xFF2DD4BF);
  static const Color primaryDark = Color(0xFF0F766E);

  // Accent Colors
  static const Color accent = Color(0xFFF97316);
  static const Color accentLight = Color(0xFFFB923C);

  // Status Colors
  static const Color success = Color(0xFF22C55E);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFEAB308);
  static const Color info = Color(0xFF3B82F6);

  // Background Colors (Slate)
  static const Color slate900 = Color(0xFF0F172A);
  static const Color slate800 = Color(0xFF1E293B);
  static const Color slate700 = Color(0xFF334155);
  static const Color slate600 = Color(0xFF475569);
  static const Color slate500 = Color(0xFF64748B);
  static const Color slate400 = Color(0xFF94A3B8);
  static const Color slate50 = Color(0xFFF8FAFC);

  // Backward compatibility aliases
  static const Color backgroundLight = slate900;
  static const Color backgroundDark = Color(0xFF020408);
  static const Color surface = slate800;
  static Color surfaceGlass = slate800.withValues(alpha: 0.7);

  // Text Colors
  static const Color textPrimary = slate50;
  static const Color textSecondary = slate400;
  static const Color textLight = Color(0xFFB0BEC5);

  // Icon Colors (from HTML design)
  static const Color emerald = Color(0xFF34D399);
  static const Color sky = Color(0xFF38BDF8);
  static const Color purple = Color(0xFFA78BFA);
  static const Color pink = Color(0xFFF472B6);
  static const Color yellow = Color(0xFFFACC15);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryLight],
  );

  static const LinearGradient splashGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [slate900, slate800],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accent, accentLight],
  );

  // Shadows
  static List<BoxShadow> primaryShadow = [
    BoxShadow(
      color: primary.withValues(alpha: 0.2),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.2),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
  ];

  // Legacy shadows for backward compatibility
  static List<BoxShadow> neonShadow = [
    BoxShadow(
      color: primary.withValues(alpha: 0.3),
      blurRadius: 10,
      spreadRadius: 2,
    ),
  ];

  static List<BoxShadow> glassShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.2),
      blurRadius: 20,
      offset: const Offset(0, 10),
    ),
  ];
}

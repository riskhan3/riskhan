import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indikhan/core/theme/app_colors.dart';

class IndiKhanLogo extends StatelessWidget {
  final double size;
  final bool withText;
  final bool isLight; // For use on dark backgrounds (default true)

  const IndiKhanLogo({
    super.key,
    this.size = 60,
    this.withText = true,
    this.isLight = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Logo Icon
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(size * 0.3),
            boxShadow: AppColors.neonShadow,
          ),
          child: Center(
            child: Icon(
              Icons.wifi_tethering,
              color: Colors.white,
              size: size * 0.6,
            ),
          ),
        ),

        if (withText) ...[
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
              style: GoogleFonts.outfit(
                fontSize: size * 0.4,
                fontWeight: FontWeight.bold,
                color: isLight ? Colors.white : AppColors.textPrimary,
              ),
              children: [
                const TextSpan(text: 'Indi'),
                TextSpan(
                  text: 'Khan',
                  style: TextStyle(color: AppColors.primary),
                ),
              ],
            ),
          ),
          Text(
            'Internet Masa Depan',
            style: GoogleFonts.outfit(
              fontSize: size * 0.15,
              color: isLight ? Colors.white70 : AppColors.textSecondary,
              letterSpacing: 2,
            ),
          ),
        ],
      ],
    );
  }
}

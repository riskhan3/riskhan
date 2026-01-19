import 'package:flutter/material.dart';
import 'dart:async';
import 'package:indikhan/core/theme/app_colors.dart';
import 'package:indikhan/core/theme/app_text_styles.dart';
import 'package:indikhan/features/onboarding/screens/onboarding_screen.dart';
import 'package:indikhan/core/widgets/logo/indikhan_logo.dart';

/// IndiKhan Splash Screen
///
/// Displays app branding with animated logo and fiber optic effects.
/// Auto-navigates to next screen after 3 seconds.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _navigateToNextScreen();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _animationController.forward();
  }

  void _navigateToNextScreen() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.splashGradient),
        child: Stack(
          children: [
            // Fiber optic background effects
            _buildFiberOpticEffects(),

            // Main content
            Center(
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: const IndiKhanLogo(size: 100, isLight: true),
                    ),
                  );
                },
              ),
            ),

            // Loading indicator at bottom
            Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Center(
                  child: Column(
                    children: [
                      const CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Internet Masa Depan', 
                        style: AppTextStyles.captionLight.copyWith(
                          color: AppColors.textSecondary,
                          letterSpacing: 1.5
                        )
                      ),
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



  Widget _buildFiberOpticEffects() {
    return CustomPaint(
      size: Size.infinite,
      painter: _FiberOpticPainter(_animationController),
    );
  }
}

/// Custom painter for fiber optic light effects
class _FiberOpticPainter extends CustomPainter {
  final Animation<double> animation;

  _FiberOpticPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    // Create multiple fiber lines
    for (int i = 0; i < 8; i++) {
      final progress = (animation.value + (i * 0.1)) % 1.0;
      final opacity = (progress * 0.5).clamp(0.0, 0.5);

      paint.shader = LinearGradient(
        colors: [
          Colors.white.withOpacity(0.0),
          Colors.white.withOpacity(opacity),
          AppColors.primaryLight.withOpacity(opacity),
          Colors.white.withOpacity(0.0),
        ],
        stops: const [0.0, 0.3, 0.7, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

      final path = Path();
      final startY = size.height * (0.2 + (i * 0.1));
      final endY = size.height * (0.4 + (i * 0.05));

      path.moveTo(-50, startY);
      path.quadraticBezierTo(
        size.width * 0.25,
        startY + 50 * (i % 2 == 0 ? 1 : -1),
        size.width * 0.5,
        size.height * 0.5,
      );
      path.quadraticBezierTo(
        size.width * 0.75,
        endY + 50 * (i % 2 == 0 ? -1 : 1),
        size.width + 50,
        endY,
      );

      canvas.drawPath(path, paint);
    }

    // Draw glowing dots
    final dotPaint = Paint()
      ..color = Colors.white.withOpacity(animation.value * 0.6)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

    for (int i = 0; i < 15; i++) {
      final x = (size.width * ((i * 0.1 + animation.value) % 1.0));
      final y = size.height * (0.3 + (i % 5) * 0.1);
      canvas.drawCircle(Offset(x, y), 2, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _FiberOpticPainter oldDelegate) => true;
}

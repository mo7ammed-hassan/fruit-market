import 'package:flutter/material.dart';
import 'package:fruit_market/core/constants/app_colors.dart';
import 'package:fruit_market/core/constants/app_images.dart';
import 'package:fruit_market/config/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _logoSlide;
  late Animation<Offset> _bottomSlide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic));

    _logoSlide = Tween<Offset>(
      begin: const Offset(0, -0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _bottomSlide = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        Future.delayed(const Duration(milliseconds: 650), () {
          if (mounted) {
            Navigator.pushReplacementNamed(context, Routes.onboardingScreen);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: FadeTransition(
        opacity: _opacity,
        child: Column(
          children: [
            const Spacer(),
            SlideTransition(
              position: _logoSlide,
              child: Image.asset(AppImages.imagesLogo),
            ),
            const Spacer(),
            SlideTransition(
              position: _bottomSlide,
              child: Image.asset(AppImages.imagesBottomSplash),
            ),
          ],
        ),
      ),
    );
  }
}

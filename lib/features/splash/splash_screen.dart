import 'package:flutter/material.dart';
import 'package:fruit_market/config/routing/app_router.dart';
import 'package:fruit_market/core/constants/app_colors.dart';
import 'package:fruit_market/core/constants/app_images.dart';

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

  late Future<String> _routeFuture;

  @override
  void initState() {
    super.initState();

    _routeFuture = AppRouter.getInitialRoute();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
    );

    _logoSlide = Tween<Offset>(
      begin: const Offset(0, -0.4),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _bottomSlide = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();

    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed && mounted) {
        final secoundRoute = await _routeFuture;
        Future.delayed(const Duration(milliseconds: 650), () {
          if (mounted) {
            Navigator.pushReplacementNamed(context, secoundRoute);
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: SlideTransition(
                position: _logoSlide,
                child: Image.asset(AppImages.imagesLogo),
              ),
            ),
            const Spacer(),
            Center(
              child: SlideTransition(
                position: _bottomSlide,
                child: Image.asset(AppImages.imagesBottomSplash),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

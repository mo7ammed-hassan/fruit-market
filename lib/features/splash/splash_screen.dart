import 'package:flutter/material.dart';
import 'package:fruit_market/core/constants/app_colors.dart';
import 'package:fruit_market/core/constants/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: Column(
        children: [
          Spacer(),
          Image.asset(AppImages.imagesLogo),
          Spacer(),
          Image.asset(AppImages.imagesBottomSplash),
        ],
      ),
    );
  }
}

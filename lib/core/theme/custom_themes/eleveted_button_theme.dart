import 'package:flutter/material.dart';
import 'package:fruit_market/core/constants/app_colors.dart';

class CustomElevetedButtonTheme {
  const CustomElevetedButtonTheme._();

  static final ElevatedButtonThemeData lightElevetedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 70),
          textStyle: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      );
}

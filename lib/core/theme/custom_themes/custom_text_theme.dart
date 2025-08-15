import 'package:flutter/material.dart';
import 'package:fruit_market/core/constants/app_colors.dart';
import 'package:fruit_market/core/utils/responsive/responsive_helpers.dart';

class CustomTextTheme {
  CustomTextTheme._();

  static TextTheme lightTextTheme(BuildContext context) => TextTheme(
    displayLarge: const TextStyle().copyWith(
      fontSize: getResponsiveFontSize(context, fontSize: 57),
      fontWeight: FontWeight.w500,
    ),
    displayMedium: const TextStyle().copyWith(
      fontSize: getResponsiveFontSize(context, fontSize: 45),
      fontWeight: FontWeight.w500,
    ),
    displaySmall: const TextStyle().copyWith(
      fontSize: getResponsiveFontSize(context, fontSize: 36),
      fontWeight: FontWeight.w500,
    ),

    ///
    headlineLarge: const TextStyle().copyWith(
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor,
      fontSize: getResponsiveFontSize(context, fontSize: 32),
    ),
    headlineMedium: const TextStyle().copyWith(
      fontWeight: FontWeight.bold,
      fontSize: getResponsiveFontSize(context, fontSize: 28),
    ),
    headlineSmall: const TextStyle().copyWith(
      fontWeight: FontWeight.bold,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
    ),

    ///
    titleLarge: const TextStyle().copyWith(
      fontWeight: FontWeight.w700,
      fontSize: getResponsiveFontSize(context, fontSize: 22),
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w400,
    ),
    titleSmall: const TextStyle().copyWith(
      fontWeight: FontWeight.w700,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
    ),

    ///
    bodyLarge: const TextStyle().copyWith(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      color: Color(0xFF78787C),
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      color: Color(0xFF656565),
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
       color: Color(0xFF656565),
      fontWeight: FontWeight.w500,
    ),

    ///
    labelLarge: const TextStyle().copyWith(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w500,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w500,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: getResponsiveFontSize(context, fontSize: 11),
      fontWeight: FontWeight.w500,
    ),
  );
}

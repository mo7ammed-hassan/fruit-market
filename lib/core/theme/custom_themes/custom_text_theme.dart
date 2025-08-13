import 'package:flutter/material.dart';

class CustomTextTheme {
  CustomTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontWeight: FontWeight.bold),

    headlineMedium: const TextStyle().copyWith(fontWeight: FontWeight.bold),
    titleLarge: const TextStyle().copyWith(fontWeight: FontWeight.w700),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 17.0,
      color: Color(0xFF78787C),
    ),

    bodyMedium: const TextStyle().copyWith(
      fontSize: 15,
      color: Color(0xFF656565),
    ),

    titleMedium: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),

    bodySmall: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    displayLarge: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
  );
}

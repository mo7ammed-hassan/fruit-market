import 'package:flutter/material.dart';

class CustomInputDecorationTheme {
  CustomInputDecorationTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 1,
    contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 18),

    labelStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: Color(0xFF242729),
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: Color(0xFF242729),
    ),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: TextStyle(color: Colors.black.withValues(alpha: 0.8)),
    outlineBorder: BorderSide.none,
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    errorBorder: InputBorder.none,
  );
}

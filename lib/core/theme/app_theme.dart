import 'package:flutter/material.dart';
import 'package:fruit_market/core/theme/custom_themes/custom_input_decoration_theme.dart';
import 'package:fruit_market/core/theme/custom_themes/custom_text_theme.dart';
import 'package:fruit_market/core/theme/custom_themes/eleveted_button_theme.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme(BuildContext context) => ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    primaryColorLight: Colors.white,
    elevatedButtonTheme: CustomElevetedButtonTheme.lightElevetedButtonTheme,
    textTheme: CustomTextTheme.lightTextTheme(context),
    inputDecorationTheme: CustomInputDecorationTheme.lightInputDecorationTheme,

    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: const CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: const FadeUpwardsPageTransitionsBuilder(),
      },
    ),
  );
}

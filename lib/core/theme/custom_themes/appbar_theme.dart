import 'package:flutter/material.dart';
import 'package:fruit_market/core/constants/app_colors.dart';

class CustomAppBarTheme {
  CustomAppBarTheme._();

  static lightAppBarTheme(BuildContext context) => AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: 24),
    actionsIconTheme: IconThemeData(color: Colors.black, size: 24),
    titleTextStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w700,
    ),
    shape: Border(
      bottom: BorderSide(
        color: AppColors.primaryColor.withValues(alpha: 0.1),
        width: 1,
      ),
    ),
  );
}

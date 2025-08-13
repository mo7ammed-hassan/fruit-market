import 'package:flutter/material.dart';
import 'package:fruit_market/core/constants/app_colors.dart';

class AuthFooterText extends StatelessWidget {
  const AuthFooterText({
    super.key,
    required this.title,
    required this.actionText,
  });
  final String title;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: title, style: Theme.of(context).textTheme.titleMedium),
          TextSpan(
            text: actionText,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.blue,
              decoration: TextDecoration.underline,
              decorationThickness: 1.5,
              decorationColor: AppColors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
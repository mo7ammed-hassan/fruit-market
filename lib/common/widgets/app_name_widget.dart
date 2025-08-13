import 'package:flutter/material.dart';
import 'package:fruit_market/core/constants/app_strings.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: AppStrings.appName[0],
            style: Theme.of(
              context,
            ).textTheme.headlineLarge?.copyWith(fontSize: 51),
          ),
          TextSpan(
            text: AppStrings.appName.substring(1),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }
}
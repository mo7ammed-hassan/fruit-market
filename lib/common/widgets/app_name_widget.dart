import 'package:flutter/material.dart';
import 'package:fruit_market/core/constants/app_strings.dart';
import 'package:fruit_market/core/utils/responsive/responsive_helpers.dart';
import 'package:fruit_market/core/utils/responsive/widgets/responsive_text_span.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveTextSpan(
      text: AppStrings.appName[0],
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
        fontSize: getResponsiveFontSize(context, fontSize: 48),
      ),

      children: [
        ResponsiveTextSpan(
          text: AppStrings.appName.substring(1),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}


/*
// Text.rich(
    //   TextSpan(
    //     children: [
    //       TextSpan(
    //         text: AppStrings.appName[0],
    //         style: Theme.of(context).textTheme.headlineLarge?.copyWith(
    //           fontSize: getResponsiveFontSize(context, fontSize: 48),
    //         ),
    //       ),
    //       TextSpan(
    //         text: AppStrings.appName.substring(1),
    //         style: Theme.of(context).textTheme.headlineLarge,
    //       ),
    //     ],
    //   ),
    // );

 */
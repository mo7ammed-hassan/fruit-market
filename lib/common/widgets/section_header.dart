import 'package:flutter/material.dart';
import 'package:fruit_market/core/constants/app_colors.dart';
import 'package:fruit_market/core/utils/responsive/widgets/responsive_text.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.actionTitle,
    this.onActionPressed,
  });
  final String title;
  final String actionTitle;

  final Function()? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ResponsiveText(
          title,
          baseStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        IconButton(
          icon: ResponsiveText(
            actionTitle,
            baseStyle: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.blue),
          ),
          onPressed: onActionPressed,
        ),
      ],
    );
  }
}

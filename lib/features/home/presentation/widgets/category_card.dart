import 'package:flutter/material.dart';
import 'package:fruit_market/core/theme/custom_themes/app_card_styles.dart';
import 'package:fruit_market/core/utils/responsive/responsive_helpers.dart';

class CategoryCard extends StatelessWidget {
  final String imagePath;
  const CategoryCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      width: getResponsiveSize(context, Axis.horizontal, 80),
      height: getResponsiveSize(context, Axis.vertical, 80),
      decoration: AppCardStyles.baseDecoration(borderRaduis: 25.0),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }
}

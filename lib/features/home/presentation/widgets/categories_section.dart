import 'package:flutter/material.dart';
import 'package:fruit_market/core/constants/app_images.dart';
import 'package:fruit_market/core/constants/app_sizes.dart';
import 'package:fruit_market/core/utils/responsive/responsive_helpers.dart';
import 'package:fruit_market/features/home/presentation/widgets/category_card.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: _padding(context),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: SizedBox(
            height: getResponsiveSize(context, Axis.vertical, 85),
            child: ListView.separated(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              separatorBuilder: (context, index) => SizedBox(
                width: getResponsiveSize(
                  context,
                  Axis.horizontal,
                  AppSizes.categoryItemSpace,
                ),
              ),
              itemBuilder: (context, index) => CategoryCard(
                imagePath: '${AppImages.imagesCategory}_${index + 1}.png',
              ),
            ),
          ),
        ),
      ),
    );
  }

  EdgeInsets _padding(BuildContext context) {
    return EdgeInsets.only(
      right: getResponsiveSize(
        context,
        Axis.horizontal,
        AppSizes.defaultPadding,
      ),
      left: getResponsiveSize(
        context,
        Axis.horizontal,
        AppSizes.defaultPadding,
      ),
      top: getResponsiveSize(
        context,
        Axis.vertical,
        AppSizes.defaultPadding / 2,
      ),

      bottom: getResponsiveSize(
        context,
        Axis.vertical,
        AppSizes.defaultPadding,
      ),
    );
  }
}

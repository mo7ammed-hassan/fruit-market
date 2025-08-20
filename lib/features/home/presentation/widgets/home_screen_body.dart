import 'package:flutter/material.dart';
import 'package:fruit_market/common/widgets/section_header.dart';
import 'package:fruit_market/core/constants/app_sizes.dart';
import 'package:fruit_market/core/constants/app_strings.dart';
import 'package:fruit_market/core/utils/responsive/responsive_helpers.dart';
import 'package:fruit_market/core/utils/responsive/widgets/responsive_gap.dart';
import 'package:fruit_market/features/home/presentation/widgets/banner_section.dart';
import 'package:fruit_market/features/home/presentation/widgets/categories_section.dart';
import 'package:fruit_market/features/home/presentation/widgets/sellers_section.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ResponsiveGap.vertical(AppSizes.defaultSpaceItems + 8),
        ),

        /// -- Banner Section --
        const BannerSection(),
        SliverToBoxAdapter(
          child: ResponsiveGap.vertical(AppSizes.defaultSpaceItems / 2),
        ),

        /// -- Categories Section --
        const CategoriesSection(),

        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: getResponsiveSize(
              context,
              Axis.horizontal,
              AppSizes.defaultPadding,
            ),
          ),
          sliver: SliverToBoxAdapter(
            child: SectionHeader(
              title: AppStrings.sallers,
              actionTitle: AppStrings.showAll,
              onActionPressed: () {},
            ),
          ),
        ),

        /// -- Sellers Section --
        const SellersSection(),
        SliverToBoxAdapter(
          child: ResponsiveGap.vertical(AppSizes.defaultSpaceItems * 1.5),
        ),
      ],
    );
  }
}

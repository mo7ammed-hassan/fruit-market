import 'package:flutter/material.dart';
import 'package:fruit_market/core/constants/app_sizes.dart';
import 'package:fruit_market/core/utils/responsive/responsive_helpers.dart';
import 'package:fruit_market/features/home/presentation/widgets/seller_card.dart';

class SellersSection extends StatelessWidget {
  const SellersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding(context),
      sliver: SliverList.separated(
        addRepaintBoundaries: true,
        itemCount: 3,
        itemBuilder: (context, index) => SellerCard(),
        separatorBuilder: (context, index) =>
            const SizedBox(height: AppSizes.sellerCardSpacing),
      ),
    );
  }

  EdgeInsets padding(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: getResponsiveSize(
        context,
        Axis.horizontal,
        AppSizes.sellerCardSpacing,
      ),
    );
  }
}

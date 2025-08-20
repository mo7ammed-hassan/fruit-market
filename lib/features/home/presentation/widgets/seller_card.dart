import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_market/core/constants/app_colors.dart';
import 'package:fruit_market/core/constants/app_images.dart';
import 'package:fruit_market/core/constants/app_sizes.dart';
import 'package:fruit_market/core/constants/app_strings.dart';
import 'package:fruit_market/core/theme/custom_themes/app_card_styles.dart';
import 'package:fruit_market/core/utils/responsive/responsive_helpers.dart';
import 'package:fruit_market/core/utils/responsive/widgets/responsive_gap.dart';
import 'package:fruit_market/core/utils/responsive/widgets/responsive_text.dart';

class SellerCard extends StatelessWidget {
  const SellerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: getResponsiveSize(context, Axis.vertical, 10),
        bottom: getResponsiveSize(context, Axis.vertical, 8),
        left: getResponsiveSize(context, Axis.horizontal, 12),
        right: getResponsiveSize(context, Axis.horizontal, 15),
      ),
      decoration: AppCardStyles.baseDecoration(borderRaduis: 20),
      child: Row(
        children: [
          /// --- Logo Section ---
          Container(
            padding: const EdgeInsets.all(16),
            decoration: AppCardStyles.baseDecoration(shape: BoxShape.circle),
            child: Column(
              children: [
                SvgPicture.asset(
                  AppImages.imagesSallerImage,
                  width: getResponsiveSize(context, Axis.horizontal, 45),
                  height: getResponsiveSize(context, Axis.vertical, 45),
                  fit: BoxFit.cover,
                ),
                ResponsiveGap.vertical(5),
                FittedBox(
                  child: ResponsiveText(
                    'Copmany Logo'.toUpperCase(),
                    baseStyle: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: 7),
                  ),
                ),
              ],
            ),
          ),

          ResponsiveGap.horizontal(AppSizes.sellerCardSpacing),

          /// --- Info Section ---
          Expanded(
            //flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: ResponsiveText(
                        AppStrings.sellerName,
                        baseStyle: Theme.of(context).textTheme.bodyMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                    ),
                    ResponsiveGap.horizontal(5),
                    SvgPicture.asset(
                      AppImages.iconsOffer,
                      width: getResponsiveSize(context, Axis.horizontal, 17),
                      height: getResponsiveSize(context, Axis.vertical, 17),
                      fit: BoxFit.scaleDown,
                    ),
                  ],
                ),
                ResponsiveGap.vertical(7),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.iconsVehicle,
                      width: getResponsiveSize(context, Axis.horizontal, 13.5),
                      height: getResponsiveSize(context, Axis.vertical, 13.5),
                      fit: BoxFit.scaleDown,
                    ),
                    const SizedBox(width: 5.0),
                    Flexible(
                      child: ResponsiveText(
                        'Delivery Charges: 0.5 KD',
                        baseStyle: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                ResponsiveGap.vertical(10),
                Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 5,
                          height: 5,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        ResponsiveText(
                          'Open',
                          baseStyle: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    ResponsiveGap.horizontal(5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 5,
                          height: 5,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        ResponsiveGap.horizontal(5),
                        ResponsiveText(
                          'Beverages',
                          baseStyle: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// --- Rating + Distance Section ---
          SizedBox(
            height: getResponsiveSize(context, Axis.vertical, 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ResponsiveText(
                  '4.5',
                  baseStyle: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ResponsiveText(
                      '2.5 KM',
                      baseStyle: Theme.of(context).textTheme.labelSmall
                          ?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryColor,
                          ),
                    ),
                    ResponsiveGap.horizontal(5),
                    SvgPicture.asset(
                      AppImages.iconsLocation,
                      fit: BoxFit.scaleDown,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

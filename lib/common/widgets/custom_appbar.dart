import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_market/core/constants/app_colors.dart';
import 'package:fruit_market/core/constants/app_images.dart';
import 'package:fruit_market/core/constants/app_strings.dart';
import 'package:fruit_market/core/utils/responsive/widgets/responsive_text.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: ResponsiveText(
        AppStrings.appName,
        baseStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            AppImages.iconsSeach,
            fit: BoxFit.scaleDown,
            width: 24,
          ),
          onPressed: () {
            // Handle search action
          },
        ),

        IconButton(
          icon: SvgPicture.asset(
            AppImages.iconsMenu,
            fit: BoxFit.scaleDown,
            width: 24,
          ),
          onPressed: () {
            // Handle search action
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

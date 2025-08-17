import 'package:flutter/material.dart';
import 'package:fruit_market/common/templates/auth_template.dart';
import 'package:fruit_market/common/widgets/auth_option_card.dart';
import 'package:fruit_market/config/routing/routes.dart';
import 'package:fruit_market/core/constants/app_colors.dart';
import 'package:fruit_market/core/constants/app_images.dart';
import 'package:fruit_market/core/constants/app_sizes.dart';
import 'package:fruit_market/core/constants/app_strings.dart';
import 'package:fruit_market/core/models/auth_switch_data.dart';
import 'package:fruit_market/core/utils/device/extensions/navigation_extension.dart';
import 'package:fruit_market/core/utils/responsive/widgets/responsive_text_span.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthTemplate(
      title: AppStrings.welcomText,
      backIcon: Icons.close,
      content: Column(
        children: [
          AuthOptionCard(
            text: AppStrings.signInWPhone,
            iconUrl: AppImages.iconsPhoneIcon,
            onTap: () => context.push(Routes.phoneScreen),
          ),
          const SizedBox(height: AppSizes.authSpaceItem),

          AuthOptionCard(
            text: AppStrings.signInWGoogle,
            iconUrl: AppImages.iconsGoogle,
            onTap: () {},
          ),
          const SizedBox(height: AppSizes.authSpaceItem),

          AuthOptionCard(
            text: AppStrings.signInWFacebook,
            textColor: Colors.white,
            iconUrl: AppImages.iconsFacebook,
            backgroundColor: AppColors.blue,
            onTap: () {},
          ),
        ],
      ),

      switchData: AuthSwitchData(
        title: AppStrings.alreadyMember,
        actionText: AppStrings.signIn,
        onActionTap: () => context.push(Routes.loginScreen),
      ),

      footer: ResponsiveTextSpan(
        text: 'By continue you agree to our ',
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
        children: [
          ResponsiveTextSpan(
            text: 'Terms of service ',
            style: Theme.of(context).textTheme.bodyLarge,
            color: AppColors.blue,
          ),
          ResponsiveTextSpan(
            text: 'and our ',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          ResponsiveTextSpan(
            text: 'Privacy Policy',
            style: Theme.of(context).textTheme.bodyLarge,
            color: AppColors.blue,
          ),
        ],
      ),
      spaceBeforeContent: 52.0,
      spaceAfterContent: 75.0,
    );
  }
}

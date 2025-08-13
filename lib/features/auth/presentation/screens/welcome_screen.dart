import 'package:flutter/material.dart';
import 'package:fruit_market/common/widgets/app_name_widget.dart';
import 'package:fruit_market/common/widgets/auth_footer_text.dart';
import 'package:fruit_market/common/widgets/auth_option_card.dart';
import 'package:fruit_market/core/constants/app_colors.dart';
import 'package:fruit_market/core/constants/app_images.dart';
import 'package:fruit_market/core/constants/app_sizes.dart';
import 'package:fruit_market/core/constants/app_strings.dart';
import 'package:fruit_market/core/utils/device/device_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.authPadding / 2),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.authPadding / 3),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(onPressed: () {}, icon: Icon(Icons.close)),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.authPadding / 2,
              ),
              child: Column(
                children: [
                  const SizedBox(height: AppSizes.authSpaceItem * 2),

                  const AppNameWidget(),
                  const SizedBox(height: AppSizes.authSpaceItem),

                  Text(
                    AppStrings.welcomText,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: DeviceUtils.screenHeight(context) * 0.05),

                  AuthOptionCard(
                    text: AppStrings.signInWPhone,
                    iconUrl: AppImages.iconsPhoneIcon,
                    onTap: () {},
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
                    iconUrl: AppImages.iconsFacebook,
                    backgroundColor: AppColors.blue,
                    onTap: () {},
                  ),

                  SizedBox(height: DeviceUtils.screenHeight(context) * 0.08),

                  const AuthFooterText(
                    title: AppStrings.alreadyMember,
                    actionText: AppStrings.signIn,
                  ),

                  SizedBox(height: DeviceUtils.screenHeight(context) * 0.08),

                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'By continue you agree to our ',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        TextSpan(
                          text: 'Terms of service ',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(color: AppColors.blue),
                        ),
                        TextSpan(
                          text: 'and our ',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),

                        TextSpan(
                          text: 'Privacy Policy',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(color: AppColors.blue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

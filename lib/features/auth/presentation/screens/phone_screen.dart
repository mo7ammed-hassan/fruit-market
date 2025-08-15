import 'package:flutter/material.dart';
import 'package:fruit_market/common/templates/auth_template.dart';
import 'package:fruit_market/common/widgets/auth_elevated_button.dart';
import 'package:fruit_market/common/widgets/phone_number_field.dart';
import 'package:fruit_market/config/routing/routes.dart';
import 'package:fruit_market/core/constants/app_sizes.dart';
import 'package:fruit_market/core/constants/app_strings.dart';
import 'package:fruit_market/core/utils/device/extensions/navigation_extension.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthTemplate(
      title: AppStrings.enterYourPhone,
      backSceenRoute: Routes.welcomeScreen,
      content: Column(
        children: [
          const PhoneInputWithAutoCountry(title: AppStrings.mobileNumber),
          const SizedBox(height: AppSizes.authSpaceItem * 2),

          AuthElevatedButton(
            text: AppStrings.submit,
            onTap: () => context.push(Routes.otpVerificationScreen),
          ),
        ],
      ),
    );
  }
}

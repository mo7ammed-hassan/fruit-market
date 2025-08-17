import 'package:flutter/material.dart';
import 'package:fruit_market/common/templates/auth_template.dart';
import 'package:fruit_market/common/widgets/auth_elevated_button.dart';
import 'package:fruit_market/common/widgets/custom_text_form_field.dart';
import 'package:fruit_market/common/widgets/phone_number_field.dart';
import 'package:fruit_market/config/routing/routes.dart';
import 'package:fruit_market/core/constants/app_sizes.dart';
import 'package:fruit_market/core/constants/app_strings.dart';
import 'package:fruit_market/core/models/auth_switch_data.dart';
import 'package:fruit_market/core/utils/device/extensions/navigation_extension.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthTemplate(
      title: AppStrings.signup,
      backSceenRoute: Routes.loginScreen,
      content: Column(
        children: [
          const CustomTextFormField(
            title: AppStrings.fullName,
            hintText: AppStrings.flName,
            contentPadding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 18.0,
            ),
          ),
          const SizedBox(height: AppSizes.authSpaceItem * 1.5),

          const PhoneInputWithAutoCountry(title: AppStrings.mobileNumber),
          const SizedBox(height: AppSizes.authSpaceItem),

          const CustomTextFormField(
            title: AppStrings.password,
            hintText: AppStrings.password,
          ),
          const SizedBox(height: AppSizes.authSpaceItem * 2),

          AuthElevatedButton(text: AppStrings.signup, onTap: () {}),
        ],
      ),

      switchData: AuthSwitchData(
        title: AppStrings.dontHaveAccount,
        actionText: AppStrings.login,
        onActionTap: () => context.pushReplacement(Routes.loginScreen),
      ),
    );
  }
}

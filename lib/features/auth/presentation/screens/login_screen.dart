import 'package:flutter/material.dart';
import 'package:fruit_market/common/templates/auth_template.dart';
import 'package:fruit_market/common/widgets/auth_elevated_button.dart';
import 'package:fruit_market/common/widgets/custom_text_form_field.dart';
import 'package:fruit_market/common/widgets/phone_number_field.dart';
import 'package:fruit_market/core/constants/app_colors.dart';
import 'package:fruit_market/core/constants/app_sizes.dart';
import 'package:fruit_market/core/constants/app_strings.dart';
import 'package:fruit_market/core/models/auth_switch_data.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthTemplate(
      title: AppStrings.login,
      content: Column(
        children: [
          const PhoneInputWithAutoCountry(title: AppStrings.mobileNumber),
          const SizedBox(height: AppSizes.authSpaceItem),

          const CustomTextFormField(title: AppStrings.password),
          const SizedBox(height: AppSizes.authSpaceItem / 2),

          Align(
            alignment: Alignment.centerRight,
            child: Text(
              AppStrings.forgetPassword,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.blue,
                decoration: TextDecoration.underline,
                decorationThickness: 1.5,
                decorationColor: AppColors.blue,
              ),
            ),
          ),
          const SizedBox(height: AppSizes.authSpaceItem),

          AuthElevatedButton(text: AppStrings.login, onTap: () {}),
        ],
      ),

      switchData: AuthSwitchData(
        title: AppStrings.dontHaveAccount,
        actionText: AppStrings.signup,
        onActionTap: () {},
      ),

      spaceAfterContent: 0.04,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fruit_market/common/templates/auth_template.dart';
import 'package:fruit_market/common/widgets/auth_elevated_button.dart';
import 'package:fruit_market/config/routing/routes.dart';
import 'package:fruit_market/core/constants/app_colors.dart';
import 'package:fruit_market/core/constants/app_strings.dart';
import 'package:fruit_market/core/models/auth_switch_data.dart';
import 'package:fruit_market/core/utils/responsive/responsive_helpers.dart';
import 'package:fruit_market/core/utils/responsive/widgets/responsive_gap.dart';
import 'package:fruit_market/core/utils/responsive/widgets/responsive_text.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthTemplate(
      title: AppStrings.otpText,
      backSceenRoute: Routes.phoneScreen,
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
              (index) => Container(
                width: getResponsiveSize(context, Axis.horizontal, 48),
                height: getResponsiveSize(context, Axis.horizontal, 48),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(21),
                decoration: BoxDecoration(
                  color: AppColors.otpColor,
                  border: Border.all(color: AppColors.termsColor),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          ResponsiveGap.vertical(52.0),

          AuthElevatedButton(text: AppStrings.confirm, onTap: () {}),
          ResponsiveGap.vertical(40.0),

          ResponsiveText(
            '60',
            baseStyle: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontSize: 30),
            fontSize: 30,
          ),
        ],
      ),

      switchData: AuthSwitchData(
        title: AppStrings.notReceived,
        actionText: AppStrings.sendAgain,
        titleStyle: Theme.of(context).textTheme.bodyLarge,
        actionStyle: Theme.of(
          context,
        ).textTheme.bodyLarge?.copyWith(color: AppColors.blue),
        onActionTap: () {},
      ),

      spaceAfterContent: 0.03,
    );
  }
}

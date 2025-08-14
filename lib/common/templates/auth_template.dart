import 'package:flutter/material.dart';
import 'package:fruit_market/common/widgets/app_name_widget.dart';
import 'package:fruit_market/common/widgets/auth_switch_text.dart';
import 'package:fruit_market/core/constants/app_sizes.dart';
import 'package:fruit_market/core/models/auth_switch_data.dart';
import 'package:fruit_market/core/utils/device/device_utils.dart';
import 'package:fruit_market/core/utils/device/extensions/navigation_extension.dart';

/// A reusable authentication screen template widget.
///
/// This widget provides a common layout for authentication-related screens,
/// including:
/// - Optional back button at the top left
/// - App name header
/// - Page title
/// - Main content area (e.g., form fields, options)
/// - Optional AuthSwitchText (login/register switch)
/// - Optional footer widget (e.g., terms and conditions)
/// - **Configurable spacing** between main content and switch text via [spaceAfterContent].
///
/// By using [AuthTemplate], you can keep a consistent design across
/// multiple authentication screens while customizing only the unique parts.
///
/// Example usage:
/// ```dart
/// AuthTemplate(
///   title: 'Welcome Back',
///   content: LoginForm(),
///   switchData: AuthSwitchData(
///     title: 'Don’t have an account? ',
///     actionText: 'Sign up',
///     onActionTap: () => Navigator.pushNamed(context, '/register'),
///   ),
///   footer: TermsAndPrivacyWidget(),
/// )
/// ```
///
/// ### Related:
///  * [AuthSwitchData], for configuring the login/register switch text.
///  * [AuthSwitchText], the widget that displays the switch link.
///
class AuthTemplate extends StatelessWidget {
  /// Creates an [AuthTemplate] widget.
  ///
  /// The [title] and [content] parameters are required.
  const AuthTemplate({
    super.key,
    required this.title,
    required this.content,
    this.footer,
    this.showBack = true,
    this.switchData,
    this.backIcon,
    this.spaceAfterContent = 0.075,
    this.backSceenRoute,
  });

  /// The title displayed below the [AppNameWidget].
  final String title;

  /// The main content widget for the screen (e.g., form, login options).
  final Widget content;

  /// Optional configuration for the [AuthSwitchText] widget.
  ///
  /// If `null`, the switch section will not be displayed.
  final AuthSwitchData? switchData;

  /// Optional footer widget displayed at the bottom of the screen.
  ///
  /// Common use case: displaying Terms and Privacy links.
  final Widget? footer;

  /// Whether to show the back button at the top-left corner.
  ///
  /// Defaults to `true`.
  final bool showBack;

  /// Optional icon for the back button.
  ///
  /// Defaults to [Icons.arrow_back_ios_new] if `null`.
  final IconData? backIcon;

  /// Height factor (relative to screen height) for spacing after [content].
  ///
  /// Defaults to `0.075` (7.5% of the screen height).
  final double spaceAfterContent;

  final String? backSceenRoute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(
          top: AppSizes.authPadding,
          bottom: AppSizes.authPadding / 2,
        ),
        children: [
          // Back button (optional)
          if (showBack)
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.authPadding / 3),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => backSceenRoute != null
                      ? context.pushReplacement(backSceenRoute!)
                      : null,

                  icon: Icon(
                    backIcon ?? Icons.arrow_back_ios_new,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          const SizedBox(height: AppSizes.authSpaceItem * 2),

          // Main content padding
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.authPadding / 2,
            ),
            child: Column(
              children: [
                // App name (header)
                const AppNameWidget(),
                const SizedBox(height: AppSizes.authSpaceItem),

                // Page title
                Text(title, style: Theme.of(context).textTheme.headlineSmall),
                SizedBox(height: DeviceUtils.screenHeight(context) * 0.055),

                // Screen-specific content
                content,
                SizedBox(
                  height: DeviceUtils.screenHeight(context) * spaceAfterContent,
                ),

                // Auth switch text like(Sign in / Sign up)
                if (switchData != null) AuthSwitchText(data: switchData!),

                // Footer (optional)
                if (footer != null) ...[
                  SizedBox(height: DeviceUtils.screenHeight(context) * 0.06),
                  footer!,
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

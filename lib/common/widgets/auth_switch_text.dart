import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market/core/constants/app_colors.dart';
import 'package:fruit_market/core/models/auth_switch_data.dart';

/// A widget that displays a static message with an interactive action link
/// for authentication-related screens.
///
/// Typically used for switching between sign-in and sign-up screens.
/// Example: `"Already have an account? Sign in"`
///
/// This widget uses [AuthSwitchData] to configure its text, styles, and
/// action callback, ensuring consistent design across the app.
///
/// Example usage:
/// ```dart
/// AuthSwitchText(
///   data: AuthSwitchData(
///     title: 'Already have an account? ',
///     actionText: 'Sign in',
///     onActionTap: () => Navigator.pushNamed(context, '/login'),
///   ),
/// )
/// ```
class AuthSwitchText extends StatelessWidget {
  /// Configuration for the switch text, including title, action text,
  /// styles, and tap callback.
  final AuthSwitchData data;

  /// Creates an [AuthSwitchText] widget.
  ///
  /// The [data] parameter is required and must not be null.
  const AuthSwitchText({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          /// Static text part (e.g., "Already have an account? ")
          TextSpan(
            text: data.title,
            style: data.titleStyle ?? Theme.of(context).textTheme.titleMedium,
          ),

          /// Interactive clickable text part (e.g., "Sign in")
          TextSpan(
            text: data.actionText,
            style:
                data.actionStyle ??
                Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.blue,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1.5,
                  decorationColor: AppColors.blue,
                ),
            recognizer: TapGestureRecognizer()..onTap = data.onActionTap,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

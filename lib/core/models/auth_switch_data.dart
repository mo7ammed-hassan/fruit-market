import 'package:flutter/material.dart';

/// A data model for configuring the [AuthSwitchText] widget.
///
/// This model stores the text content, styles, and action callback
/// for the authentication switch section (e.g.,
/// `"Already have an account? Sign in"`).
///
/// Using [AuthSwitchData] ensures that all necessary parameters are
/// provided in a clean, reusable way without duplicating logic across
/// different authentication screens.
///
/// Example:
/// ```dart
/// AuthSwitchData(
///   title: 'Already have an account? ',
///   actionText: 'Sign in',
///   onActionTap: () => Navigator.pushNamed(context, '/login'),
///   titleStyle: TextStyle(fontSize: 14, color: Colors.grey),
///   actionStyle: TextStyle(fontSize: 14, color: Colors.blue),
///   textAlign: TextAlign.center,
/// )
/// ```
class AuthSwitchData {
  /// The leading static text before the clickable action.
  ///
  /// Example: `"Already have an account? "`
  final String title;

  /// The clickable action text that triggers [onActionTap].
  ///
  /// Example: `"Sign in"`
  final String actionText;

  /// The callback function executed when [actionText] is tapped.
  final VoidCallback onActionTap;

  /// Optional text style for [title].
  ///
  /// If `null`, defaults to the current [TextTheme.bodyLarge] style.
  final TextStyle? titleStyle;

  /// Optional text style for [actionText].
  ///
  /// If `null`, defaults to the current [TextTheme.bodyLarge]
  /// but with a link color (e.g., blue).
  final TextStyle? actionStyle;

  /// Alignment for the entire text row.
  ///
  /// Defaults to [TextAlign.center].
  final TextAlign textAlign;

  /// Creates an [AuthSwitchData] instance.
  ///
  /// All parameters except [titleStyle], [actionStyle], and [textAlign]
  /// are required.
  const AuthSwitchData({
    required this.title,
    required this.actionText,
    required this.onActionTap,
    this.titleStyle,
    this.actionStyle,
    this.textAlign = TextAlign.center,
  });
}

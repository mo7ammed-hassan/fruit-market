import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void push(String route, {Object? arguments}) =>
      Navigator.pushNamed(this, route);
  void pushReplacement(String route, {Object? arguments}) =>
      Navigator.pushReplacementNamed(this, route);
  void pushAndRemovePages(String route, {Object? arguments}) =>
      Navigator.pushNamedAndRemoveUntil(
        this,
        route,
        arguments: arguments,
        (route) => false,
      );

  void pop() => Navigator.pop(this);
}

import 'package:flutter/material.dart';

class DeviceUtils {
  DeviceUtils._();

  static const toolbarHeight = kToolbarHeight;

  static double screenWidth(context) => MediaQuery.of(context).size.width;
  static double screenHeight(context) => MediaQuery.of(context).size.height;

  static bool isPortrait(context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;
}

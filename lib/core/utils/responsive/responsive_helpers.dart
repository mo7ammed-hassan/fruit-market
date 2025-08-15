import 'package:flutter/material.dart';
import 'package:fruit_market/core/utils/responsive/screen_sizes.dart';

double getResponsiveFontSize(
  BuildContext context, {
  required double fontSize,
  double minScale = 0.8,
  double maxScale = 1.2,
}) {
  double scaleFactor = getScaleFactor(context);

  double responsiveFontSize = fontSize * scaleFactor;

  return responsiveFontSize.clamp(fontSize * minScale, fontSize * maxScale);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  if (width < ScreenSizes.tablet) {
    return width / 375; // base phone width
  } else if (width < ScreenSizes.desktop) {
    return width / 800; // base tablet width
  } else {
    return width / 1920; // base desktop width
  }
}

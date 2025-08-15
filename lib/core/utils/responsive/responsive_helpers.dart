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

double getScaleFactorHeight(BuildContext context) {
  double height = MediaQuery.of(context).size.height;

  if (height < ScreenSizes.tabletHeight) {
    return height / 932; // base phone height
  } else if (height < ScreenSizes.desktopHeight) {
    return height / 1280; // base tablet height
  } else {
    return height / 1080; // base desktop height
  }
}

double getResponsiveSize(
  BuildContext context,
  Axis? axis,
  double size, {
  double minScale = 0.8,
  double maxScale = 1.2,
}) {
  double scaleFactor = axis == Axis.vertical
      ? getScaleFactorHeight(context)
      : getScaleFactor(context);

  double responsiveSize = size * scaleFactor;

  return responsiveSize.clamp(size * minScale, size * maxScale);
}

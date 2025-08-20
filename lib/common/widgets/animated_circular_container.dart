import 'package:flutter/material.dart';
import 'package:fruit_market/core/constants/app_colors.dart';

class AnimatedCircularContainer extends StatelessWidget {
  final double? width, height;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color? color;
  final Color borderColor;
  final Duration duration;
  final Curve curve;

  const AnimatedCircularContainer({
    super.key,
    this.width = 8,
    this.height = 8,
    this.padding = 0,
    this.color,
    this.borderColor = AppColors.primaryColor,
    this.margin,
    this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      curve: curve,
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      margin: margin,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: borderColor, width: 1),
      ),
      child: child,
    );
  }
}

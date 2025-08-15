import 'package:flutter/material.dart';
import 'package:fruit_market/core/utils/responsive/responsive_helpers.dart';

// ResponsiveText: Text widget responsive based on screen width
// Can use baseStyle from Theme.of(context).textTheme

class ResponsiveText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextStyle? baseStyle;
  final Color? color;
  final TextAlign? textAlign;
  final double minScale;
  final double maxScale;
  final int? maxLines;
  final TextOverflow? overflow;

  const ResponsiveText(
    this.text, {
    super.key,
    this.fontSize = 16,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.minScale = 0.8,
    this.maxScale = 1.2,
    this.maxLines,
    this.overflow,
    this.baseStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: (baseStyle ?? TextStyle()).copyWith(
        fontSize: getResponsiveFontSize(
          context,
          fontSize: baseStyle?.fontSize ?? fontSize,
          minScale: minScale,
          maxScale: maxScale,
        ),
        fontWeight: fontWeight ?? baseStyle?.fontWeight,
        color: color ?? baseStyle?.color,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppCardStyles {
  static BoxDecoration baseDecoration({
    double? borderRaduis,
    BoxShape shape = BoxShape.rectangle,
  }) => BoxDecoration(
    color: Colors.white,
    shape: borderRaduis == null ? shape : BoxShape.rectangle,
    borderRadius: borderRaduis != null
        ? BorderRadius.circular(borderRaduis)
        : null,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withValues(alpha: 0.3),
        spreadRadius: 1,
        blurRadius: 4,
        offset: const Offset(0, 1),
      ),
    ],
  );
}

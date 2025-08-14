import 'package:flutter/material.dart';
import 'package:fruit_market/common/widgets/shadow_container.dart';
import 'package:fruit_market/core/constants/app_sizes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthOptionCard extends StatelessWidget {
  const AuthOptionCard({
    super.key,
    this.iconUrl,
    required this.text,
    this.iconColor,
    this.onTap,
    this.backgroundColor, this.textColor,
  });

  final String? iconUrl;
  final String text;
  final Color? textColor;
  final Color? iconColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ShadowContainer(
        padding: EdgeInsets.symmetric(vertical: AppSizes.textFieldVPadding),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconUrl?.isNotEmpty == true)
              SvgPicture.asset(iconUrl!, fit: BoxFit.scaleDown, width: 23),
            SizedBox(width: 10),

            Flexible(
              child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: textColor ?? Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

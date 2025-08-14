import 'package:flutter/material.dart';

class AuthElevatedButton extends StatelessWidget {
  const AuthElevatedButton({super.key, required this.text, this.onTap});
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
        ),
        child: Text(text),
      ),
    );
  }
}

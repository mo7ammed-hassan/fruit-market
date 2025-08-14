import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit_market/common/widgets/shadow_container.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.title,
    this.keyboardType,
    this.onChanged,
    this.inputFormatters,
    this.contentPadding,
  });
  final TextEditingController? controller;
  final String? hintText;
  final String? title;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title?.isNotEmpty == true) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title!, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(width: 4),
              const Icon(Icons.star, color: Colors.red, size: 8),
            ],
          ),
          const SizedBox(height: 10),
        ],

        ShadowContainer(
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: contentPadding,
            ),
          ),
        ),
      ],
    );
  }
}

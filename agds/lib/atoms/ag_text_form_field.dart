import 'package:flutter/material.dart';

import '../tokens/colors.dart';
import '../tokens/text_style.dart';

class AgTextFormField extends StatelessWidget {
  const AgTextFormField({
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    super.key,
  });
  final bool obscureText;
  final TextEditingController? controller;
  final String? hintText;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      style: AgTextStyle.ralewayStyle.copyWith(
        fontWeight: FontWeight.w400,
        color: AgColors.secondaryColor(context),
        fontSize: 12.0,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: prefixIcon != null
            ? IconButton(
                onPressed: () {},
                icon: Icon(prefixIcon),
              )
            : null,
        contentPadding: const EdgeInsets.only(top: 16.0),
        hintText: hintText,
        hintStyle: AgTextStyle.ralewayStyle.copyWith(
          fontWeight: FontWeight.w400,
          color: AgColors.secondaryColor(context).withOpacity(0.5),
          fontSize: 12.0,
        ),
      ),
    );
  }
}

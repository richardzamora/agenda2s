import 'package:agds/agds.dart';
import 'package:agds/tokens/shadows.dart';
import 'package:flutter/material.dart';

import '../tokens/text_style.dart';

class AgTextFormField extends StatelessWidget {
  const AgTextFormField({
    required this.controller,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.isSelector = false,
    this.selectorElements,
    super.key,
  });
  final bool obscureText;
  final TextEditingController controller;
  final String? hintText;
  final IconData? prefixIcon;
  final bool isSelector;
  final List<AgSelectorModel>? selectorElements;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AgColors.surfaceColor(context),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: inverseSurfaceShadow(context)),
      child: TextField(
        onTap: isSelector ? () async => showSelector(context) : null,
        readOnly: isSelector,
        obscureText: obscureText,
        controller: controller,
        style: AgTextStyle.ralewayStyle.copyWith(
          fontWeight: FontWeight.w400,
          color: AgColors.inverseSurfaceColor(context),
          fontSize: 12.0,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: isSelector
              ? Icon(
                  Icons.arrow_drop_down,
                )
              : null,
          prefixIcon: prefixIcon != null
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(prefixIcon),
                )
              : null,
          contentPadding: EdgeInsets.only(
            left: 16.0,
            top: prefixIcon != null || isSelector ? 16.0 : 0,
          ),
          hintText: hintText,
          hintStyle: AgTextStyle.ralewayStyle.copyWith(
            fontWeight: FontWeight.w600,
            color: AgColors.inverseSurfaceColor(context).withOpacity(0.5),
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Future<void> showSelector(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (dialogContext) => SimpleDialog(
              title: Text(hintText ?? ''),
              children: [
                if (selectorElements != null)
                  for (AgSelectorModel element in selectorElements!)
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      width: 200,
                      child: AgButton(
                        buttonText: element.text,
                        onTap: () {
                          controller.text = element.value;
                          Navigator.pop(context);
                        },
                      ),
                    ),
              ],
            ));
  }
}

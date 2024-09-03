import 'package:agds/agds.dart';
import 'package:flutter/material.dart';

enum FieldType { text, date, selector, multiSelector }

class AgFormFieldElement extends StatelessWidget {
  const AgFormFieldElement({
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.hasRequiredOption = false,
    this.type = FieldType.text,
    this.selectorElements,
    this.onUpdateMultiSelectElement,
    this.defaultValueElements,
    super.key,
  });
  final bool obscureText;
  final bool hasRequiredOption;
  final TextEditingController? controller;
  final String? hintText;
  final IconData? prefixIcon;
  final FieldType type;
  final List<AgSelectorModel>? selectorElements;
  final List<AgSelectorModel>? defaultValueElements;
  final Function(List<AgSelectorModel>)? onUpdateMultiSelectElement;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case FieldType.text:
        return AgTextFormField(
          controller: controller ?? TextEditingController(),
          hintText: hintText,
          prefixIcon: prefixIcon,
          obscureText: obscureText,
        );
      case FieldType.date:
        return AgTextFormField(
          controller: controller ?? TextEditingController(),
          hintText: hintText,
          prefixIcon: prefixIcon,
          obscureText: obscureText,
        );
      case FieldType.selector:
        return AgTextFormField(
          controller: controller ?? TextEditingController(),
          hintText: hintText,
          prefixIcon: prefixIcon,
          obscureText: obscureText,
          isSelector: true,
          selectorElements: selectorElements,
        );
      case FieldType.multiSelector:
        return AgMultiSelectorFormField(
          hasRequiredOption: hasRequiredOption,
          hintText: hintText,
          prefixIcon: prefixIcon,
          selectorElements: selectorElements,
          defaultValueElements: defaultValueElements,
          onSelectedElement: onUpdateMultiSelectElement,
        );
      default:
        return AgTextFormField(
          controller: controller ?? TextEditingController(),
          hintText: hintText,
          prefixIcon: prefixIcon,
          obscureText: obscureText,
        );
    }
  }
}

class AgSelectorModel {
  AgSelectorModel(this.value, this.text, {this.isRequired = false});
  String value;
  String text;
  bool isRequired;
}

import 'package:agds/atoms/ag_button.dart';
import 'package:agds/organisms/ag_form_field_element.dart';
import 'package:flutter/material.dart';

class AgFormTemplate extends StatelessWidget {
  const AgFormTemplate(
      {required this.fields,
      required this.continueText,
      required this.onTapContinue,
      super.key});
  final List<AgFormFieldElement> fields;
  final VoidCallback onTapContinue;
  final String continueText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (AgFormFieldElement field in fields)
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 4),
            child: field,
          ),
        const SizedBox(height: 16),
        Center(
          child: SizedBox(
            width: 200,
            child: AgButton(
              onTap: onTapContinue,
              buttonText: continueText,
              buttonType: AgButtonType.secondary,
            ),
          ),
        ),
      ],
    );
  }
}

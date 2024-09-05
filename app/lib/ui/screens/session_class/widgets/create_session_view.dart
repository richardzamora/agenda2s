import 'package:agds/agds.dart';
import 'package:flutter/material.dart';

class CreateSessionView extends StatelessWidget {
  const CreateSessionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AgFormTemplate(
      fields: [
        AgFormFieldElement(
          hintText: "Agenda",
          type: FieldType.selector,
          selectorElements: [
            AgSelectorModel('APO1', 'Programación orientada a Objetos'),
          ],
        ),
        AgFormFieldElement(
          hintText: "Profesional",
        ),
        AgFormFieldElement(
          hintText: "Descripción",
        ),
        AgFormFieldElement(
          hintText: "Ubicación",
        ),
      ],
      continueText: 'Crear',
      onTapContinue: () {},
    );
  }
}

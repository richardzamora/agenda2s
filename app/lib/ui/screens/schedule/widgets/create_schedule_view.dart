import 'package:agds/agds.dart';
import 'package:flutter/material.dart';

class CreateScheduleView extends StatelessWidget {
  const CreateScheduleView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AgFormTemplate(
      fields: [
        AgFormFieldElement(
          hintText: "Título",
        ),
        AgFormFieldElement(
          hintText: "Profesional",
        ),
        AgFormFieldElement(
          hintText: "Categorías",
          type: FieldType.multiSelector,
          hasRequiredOption: true,
          selectorElements: [
            AgSelectorModel('poo', 'Prog. orientada a objetos'),
            AgSelectorModel('java-1', 'java básico'),
            AgSelectorModel('flutter-1', 'flutter básico'),
            AgSelectorModel('diseño-1', 'diseño básico'),
            AgSelectorModel('java-2', 'java intermedio'),
            AgSelectorModel('flutter-2', 'flutter intermedio'),
            AgSelectorModel('diseño-2', 'diseño intermedio'),
            AgSelectorModel('java-3', 'java avanzado'),
            AgSelectorModel('flutter-3', 'flutter avanzado'),
            AgSelectorModel('diseño-3', 'diseño avanzado'),
          ],
        ),
      ],
      continueText: 'Crear',
      onTapContinue: () {},
    );
  }
}

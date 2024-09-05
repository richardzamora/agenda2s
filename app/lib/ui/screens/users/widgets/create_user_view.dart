import 'package:agds/agds.dart';
import 'package:flutter/material.dart';

class CreateUserView extends StatelessWidget {
  const CreateUserView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AgFormTemplate(
      fields: [
        AgFormFieldElement(
          hintText: "correo",
        ),
        AgFormFieldElement(
          hintText: "contraseña",
          obscureText: true,
        ),
        AgFormFieldElement(
          hintText: "nombres",
        ),
        AgFormFieldElement(
          hintText: "apellidos",
        ),
        AgFormFieldElement(
          hintText: "fecha de nacimiento",
          type: FieldType.date,
        ),
        AgFormFieldElement(
          hintText: "Categorías",
          type: FieldType.multiSelector,
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
        AgFormFieldElement(
          hintText: "Tipo de usuario",
          type: FieldType.selector,
          selectorElements: [
            AgSelectorModel('user', 'Usuario'),
            AgSelectorModel('professional', 'Profesional'),
            AgSelectorModel('admin', 'Administrador'),
            AgSelectorModel('developer', 'Desarrollador'),
          ],
        ),
      ],
      continueText: 'Crear',
      onTapContinue: () {},
    );
  }
}

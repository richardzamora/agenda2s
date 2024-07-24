import 'package:agds/agds.dart';
import 'package:agenda2/ui/helpers/single_page_template.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  static String routeName = "/schedule";
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SinglePageTemplate(
      routeName,
      title: 'Gestionar agenda',
      body: Column(
        children: [
          AgListButtons(
              elements: ['Listar', 'Crear'],
              defaultElement: 'Listar',
              onTapElement: (value) {}),
          Text("Schedule page"),
        ],
      ),
    );
  }
}

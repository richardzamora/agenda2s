import 'package:agds/agds.dart';
import 'package:agenda2/ui/helpers/single_page_template.dart';
import 'package:agenda2/ui/ui.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SinglePageTemplate(
      routeName,
      title: 'Home',
      body: Column(
        children: [
          AgListButtons(
              elements: ['Listar', 'Crear'],
              defaultElement: 'Listar',
              onTapElement: (value) {}),
          Text("Home page"),
          Text(ResponsiveWidget.isSmallScreen(context) ? 'Is SmallSize' : ''),
          Text(ResponsiveWidget.isMediumScreen(context) ? 'Is MediumSize' : ''),
          Text(ResponsiveWidget.isLargeScreen(context) ? 'Is LargeSize' : ''),
        ],
      ),
    );
  }
}

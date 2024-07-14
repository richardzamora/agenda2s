import 'package:agenda2/ui/helpers/single_page_template.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SinglePageTemplate(routeName,
        body: Center(child: Text("Home page")));
  }
}

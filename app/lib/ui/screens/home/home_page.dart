import 'package:agds/agds.dart';
import 'package:agenda2/ui/screens/auth/login_page.dart';
import 'package:agenda2/ui/ui.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AgAppbar(),
      drawer: ResponsiveWidget.isSmallScreen(context) ? AgDrawer() : null,
      body: Center(child: Text("Home page")),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, LoginPage.routeName);
          },
          child: Text("-")),
    );
  }
}

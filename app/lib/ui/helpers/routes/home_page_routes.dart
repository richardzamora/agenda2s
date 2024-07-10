import 'package:agenda2/ui/screens/home/home_page.dart';
import 'package:flutter/material.dart';

class HomePageRoutes {
  HomePageRoutes._();

  static HomePage getHomePage(BuildContext context) => HomePage();

  static void goHome(BuildContext context) {
    Navigator.popAndPushNamed(context, HomePage.routeName);
  }
}

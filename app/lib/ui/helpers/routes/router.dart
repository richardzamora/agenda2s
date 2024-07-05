import 'package:agenda2/ui/helpers/routes/home_page_routes.dart';
import 'package:agenda2/ui/helpers/routes/login_page_routes.dart';
import 'package:agenda2/ui/screens/auth/login_page.dart';
import 'package:agenda2/ui/screens/home/home_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Map<String, WidgetBuilder> routes() {
    final Map<String, WidgetBuilder> routes = {};
    routes.addAll({
      LoginPage.routeName: LoginPageRoutes.getLoginPage,
      HomePage.routeName: HomePageRoutes.getHomePage,
    });
    return routes;
  }
}

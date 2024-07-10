import 'package:agenda2/infraestructure/driven_adapters/repository/auth_api.dart';
import 'package:agenda2/ui/helpers/routes/home_page_routes.dart';
import 'package:agenda2/ui/screens/home/home_page.dart';
import 'package:flutter/material.dart';

import '../../screens/auth/login_page.dart';

class LoginPageRoutes {
  LoginPageRoutes._();

  static LoginPage getLoginPage(BuildContext context) => LoginPage(
        authGateway: AuthApi(context),
        onLoginSuccess: () => HomePageRoutes.goHome(context),
      );
}

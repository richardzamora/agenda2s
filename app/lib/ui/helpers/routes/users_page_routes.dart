import 'package:agenda2/infraestructure/driven_adapters/repository/users_api.dart';
import 'package:agenda2/ui/screens/users/users_page.dart';
import 'package:flutter/material.dart';

class UsersPageRoutes {
  UsersPageRoutes._();

  static UsersPage getUsersPage(BuildContext context) => UsersPage(
        userGateway: UsersApi(context),
      );
}

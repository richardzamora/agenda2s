import 'package:agds/agds.dart';
import 'package:agds/atoms/ag_drawer_button_element.dart';
import 'package:agenda2/ui/screens/appointment/appointment_page.dart';
import 'package:agenda2/ui/screens/auth/login_page.dart';
import 'package:agenda2/ui/screens/home/home_page.dart';
import 'package:agenda2/ui/screens/schedule/schedule_page.dart';
import 'package:agenda2/ui/screens/users/users_page.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  static const double drawerWidth = 300;
  const AppDrawer(
      {super.key, this.isInsideDrawer = true, required this.selectedRoute});
  final bool isInsideDrawer;
  final String selectedRoute;

  @override
  Widget build(BuildContext context) {
    return AgDrawer(
      elements: [
        //Poner condicionales cuando se sepa el rol del usuario
        DrawerButtonModel('Login', LoginPage.routeName),
        DrawerButtonModel('Home', HomePage.routeName),
        DrawerButtonModel('Gestionar Usuarios', UsersPage.routeName),
        DrawerButtonModel('Gestionar Agendas', SchedulePage.routeName),
        DrawerButtonModel('Gestionar Citas', AppointmentPage.routeName),
      ],
      selectedRoute: selectedRoute,
      isInsideDrawer: isInsideDrawer,
      drawerWidth: drawerWidth,
    );
  }
}

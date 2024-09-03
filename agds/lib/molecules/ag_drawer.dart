import 'package:agds/agds.dart';
import 'package:flutter/material.dart';

import '../atoms/ag_drawer_button_element.dart';

class AgDrawer extends StatelessWidget {
  const AgDrawer(
      {super.key,
      required this.elements,
      required this.selectedRoute,
      required this.drawerWidth,
      required this.logout,
      this.isInsideDrawer = true});
  final bool isInsideDrawer;
  final List<DrawerButtonModel> elements;
  final String selectedRoute;
  final double drawerWidth;
  final VoidCallback logout;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox(
        width: isInsideDrawer ? null : drawerWidth,
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundColor:
                  AgColors.inverseSurfaceColor(context).withOpacity(0.2),
              child: Container(
                  padding: const EdgeInsets.all(16),
                  child:
                      const Image(image: AssetImage('assets/images/icon.png'))),
            ),
            const SizedBox(height: 20),
            for (DrawerButtonModel model in elements)
              AgDrawerButtonElement(model, selectedRoute),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
              child: AgButton(
                onTap: logout,
                buttonText: 'Cerrar sesión',
              ),
            )
          ],
        ),
      ),
    );
  }
}

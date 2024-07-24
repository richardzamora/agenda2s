import 'package:agds/agds.dart';
import 'package:flutter/material.dart';

import '../atoms/ag_drawer_button_element.dart';

class AgDrawer extends StatelessWidget {
  const AgDrawer(
      {super.key,
      required this.elements,
      required this.selectedRoute,
      required this.drawerWidth,
      this.isInsideDrawer = true});
  final bool isInsideDrawer;
  final List<DrawerButtonModel> elements;
  final String selectedRoute;
  final double drawerWidth;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox(
        width: isInsideDrawer ? null : drawerWidth,
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              child: Text('AG2'),
            ),
            SizedBox(height: 20),
            for (DrawerButtonModel model in elements)
              AgDrawerButtonElement(model, selectedRoute),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
              child: AgButton(
                onTap: () {},
                buttonText: 'Logout',
              ),
            )
          ],
        ),
      ),
    );
  }
}

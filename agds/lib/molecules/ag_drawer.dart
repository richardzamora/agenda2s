import 'package:agds/agds.dart';
import 'package:flutter/material.dart';

import '../atoms/ag_drawer_button_element.dart';

class AgDrawer extends StatelessWidget {
  const AgDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            child: Text('AG2'),
          ),
          SizedBox(height: 20),
          DrawerButtonElement(onTap: () {}, text: 'Richard'),
          DrawerButtonElement(onTap: () {}, text: 'Javier'),
          DrawerButtonElement(onTap: () {}, text: 'Zamora', isSelected: true),
          DrawerButtonElement(onTap: () {}, text: 'Herrera'),
          DrawerButtonElement(onTap: () {}, text: 'Carreño'),
          DrawerButtonElement(onTap: () {}, text: 'Vargas'),
          DrawerButtonElement(onTap: () {}, text: 'Richard'),
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
    );
  }
}

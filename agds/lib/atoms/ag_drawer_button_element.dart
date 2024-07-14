import 'package:flutter/material.dart';

import '../agds.dart';

class AgDrawerButtonElement extends StatelessWidget {
  const AgDrawerButtonElement(
    this.model,
    this.selectedRoute, {
    super.key,
  });
  final DrawerButtonModel model;
  final String selectedRoute;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: model.route == selectedRoute
                ? AgColors.primaryColor(context).withOpacity(0.5)
                : AgColors.secondaryColor(context).withOpacity(0.5)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: !(model.route == selectedRoute)
                ? () => Navigator.popAndPushNamed(context, model.route)
                : null,
            borderRadius: BorderRadius.circular(5),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Center(child: Text(model.text)),
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerButtonModel {
  DrawerButtonModel(
    this.text,
    this.route,
  );

  final String text;
  final String route;
}

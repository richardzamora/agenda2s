import 'package:agds/molecules/ag_appbar.dart';
import 'package:agenda2/ui/helpers/app_drawer.dart';
import 'package:agenda2/ui/helpers/responsive_widget.dart';
import 'package:flutter/material.dart';

class SinglePageTemplate extends StatelessWidget {
  const SinglePageTemplate(this.routeName, {required this.body, super.key});
  final String routeName;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context) ? AgAppbar() : null,
      drawer: ResponsiveWidget.isSmallScreen(context)
          ? AppDrawer(selectedRoute: routeName)
          : null,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (!ResponsiveWidget.isSmallScreen(context))
            AppDrawer(selectedRoute: routeName, isInsideDrawer: false),
          Expanded(child: body),
        ],
      ),
    );
  }
}

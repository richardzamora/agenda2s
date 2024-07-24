import 'package:agds/molecules/ag_appbar.dart';
import 'package:agenda2/ui/helpers/app_drawer.dart';
import 'package:agenda2/ui/helpers/responsive_widget.dart';
import 'package:flutter/material.dart';

class SinglePageTemplate extends StatelessWidget {
  const SinglePageTemplate(this.routeName,
      {required this.body, required this.title, super.key});
  final String routeName;
  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AgAppbar(title: title)
          : null,
      drawer: ResponsiveWidget.isSmallScreen(context)
          ? AppDrawer(selectedRoute: routeName)
          : null,
      body: LayoutBuilder(builder: (context, constraints) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (!ResponsiveWidget.isSmallScreen(context))
              AppDrawer(selectedRoute: routeName, isInsideDrawer: false),
            Container(
              constraints: BoxConstraints(
                maxWidth: constraints.maxWidth >= ResponsiveWidget.smallPibot
                    ? constraints.maxWidth - AppDrawer.drawerWidth - 4
                    : constraints.maxWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!ResponsiveWidget.isSmallScreen(context))
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: Center(
                          child: Text(title,
                              style: const TextStyle(fontSize: 24))),
                    ),
                  Expanded(
                    child: Center(
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: constraints.maxWidth >=
                                  ResponsiveWidget.largePibot
                              ? ResponsiveWidget.largePibot -
                                  AppDrawer.drawerWidth -
                                  4
                              : ResponsiveWidget.largePibot,
                        ),
                        child: body,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

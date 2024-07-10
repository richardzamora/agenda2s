import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  static const double smallPibot = 600;
  static const double largePibot = 1040;

  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < smallPibot;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > largePibot;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= smallPibot &&
        MediaQuery.of(context).size.width <= largePibot;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > largePibot) {
          return largeScreen;
        } else if (constraints.maxWidth <= largePibot &&
            constraints.maxWidth >= smallPibot) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}

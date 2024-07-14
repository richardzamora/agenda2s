import 'package:flutter/material.dart';

class AgColors {
  static Color primaryColor(BuildContext context) =>
      Theme.of(context).colorScheme.primary;
  static Color secondaryColor(BuildContext context) =>
      Theme.of(context).colorScheme.secondary;
  static Color surfaceColor(BuildContext context) =>
      Theme.of(context).colorScheme.surface;
  static Color errorColor(BuildContext context) =>
      Theme.of(context).colorScheme.error;
  static Color inverseSurfaceColor(BuildContext context) =>
      Theme.of(context).colorScheme.inverseSurface;
  static Color successColor(BuildContext context) =>
      Theme.of(context).colorScheme.tertiary;
  static Color warningColor(BuildContext context) =>
      Theme.of(context).colorScheme.tertiaryContainer;
}

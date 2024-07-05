import 'package:flutter/material.dart';

class AgColors {
  static primaryColor(BuildContext context) =>
      Theme.of(context).colorScheme.primary;
  static secondaryColor(BuildContext context) =>
      Theme.of(context).colorScheme.secondary;
  static surfaceColor(BuildContext context) =>
      Theme.of(context).colorScheme.surface;
  static errorColor(BuildContext context) =>
      Theme.of(context).colorScheme.error;
  static inverseSurfaceColor(BuildContext context) =>
      Theme.of(context).colorScheme.inverseSurface;
  static successColor(BuildContext context) =>
      Theme.of(context).colorScheme.tertiary;
  static warningColor(BuildContext context) =>
      Theme.of(context).colorScheme.tertiaryContainer;
}

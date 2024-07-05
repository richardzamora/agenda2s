import 'package:agenda2/agenda2.dart';
import 'package:agenda2/session.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Map<String, String> env = {};

class Setup {
  static Future<AppConfig>  getApp(
      {required Environment environment,
      required List<SingleChildWidget> providers}) async {
    return AppConfig(
      environment: environment,
      appName: env['APP_NAME']!,
      apiBaseUrl: env['BASE_URL']!,
      child: MultiProvider(providers: providers, child: const AppSession()),
    );
  }
}

class AppConfig extends InheritedWidget {
  const AppConfig({
    required this.environment,
    required this.appName,
    required this.apiBaseUrl,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  final Environment environment;
  final String appName;
  final String apiBaseUrl;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<AppConfig>();
}

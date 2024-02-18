import 'package:agenda2/agenda2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<void> initApp(Environment environment,
    {bool setPreferredOrientation = true}) async {
  final List<SingleChildWidget> items = [
    ChangeNotifierProvider(create: (_) => SessionNotifier()),
  ];
  WidgetsFlutterBinding.ensureInitialized();

  final configuredApp =
      await Setup.getApp(environment: environment, providers: items);

  if (setPreferredOrientation) {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((_) => runApp(configuredApp));
  } else {
    runApp(configuredApp);
  }
}

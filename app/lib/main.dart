import 'package:agenda2/agenda2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() async {
  GoogleFonts.config.allowRuntimeFetching = false;
  env = await LoadEnvHelper.loadEnvFile('assets/env/mock/.env_mock');
  await initApp(Environment.Mock);
}

Future<void> initApp(Environment environment,
    {bool setPreferredOrientation = true}) async {
  GoogleFonts.config.allowRuntimeFetching = false;
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

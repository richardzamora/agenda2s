import 'package:agenda2/ui/helpers/router.dart';
import 'package:agenda2/ui/screens/auth/login_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xff228896),
          primary: Color(0xff055E68),
          secondary: Color(0xff62A388),
          background: Color(0xff343434),
        ),
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xff228896),
          primary: Color(0xff228896),
          secondary: Color(0xffA9C52F),
          background: Color(0xffFDFDFD),
        ),
      ),
      routes: AppRouter().routes(),
      initialRoute: LoginPage.routeName,
    );
  }
}

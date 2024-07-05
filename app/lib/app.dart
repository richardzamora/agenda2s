import 'package:agenda2/ui/helpers/routes/router.dart';
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
          seedColor: const Color(0xff228896),
          primary: const Color(0xff055E68),
          secondary: const Color(0xff62A388),
          surface: const Color(0xff343434),
          error: const Color(0xffEF2082),
          inverseSurface: const Color(0xffFDFDFD),
          tertiary: const Color(0xff64FF71),
          tertiaryContainer: const Color(0xffFFE86A),
        ),
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff228896),
          primary: const Color(0xff228896),
          secondary: const Color(0xffA9C52F),
          surface: const Color(0xffFDFDFD),
          error: const Color(0xffEF2082),
          inverseSurface: const Color(0xff343434),
          tertiary: const Color(0xff64FF71),
          tertiaryContainer: const Color(0xffFFE86A),
        ),
      ),
      routes: AppRouter().routes(),
      initialRoute: LoginPage.routeName,
    );
  }
}

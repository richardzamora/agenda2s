import 'package:flutter/material.dart';

import 'agenda2.dart';

class AppSession extends StatelessWidget {
  const AppSession({super.key});

  @override
  Widget build(BuildContext context) {
    return const Listener(
      child: MyApp(),
    );
  }
}

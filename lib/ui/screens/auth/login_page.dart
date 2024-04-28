import 'package:agenda2/ui/screens/home/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static String routeName = "/login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Login page")),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, HomePage.routeName);
          },
          child: Text("+")),
    );
  }
}

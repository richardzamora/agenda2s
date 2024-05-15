import 'package:agds/agds.dart';
import 'package:agenda2/ui/screens/home/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static String routeName = "/login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AgButton(
            onTap: () => print("first button"),
            buttonText: "primary button",
            buttonType: AgButtonType.primary,
            isExpanded: true,
          ),
          AgButton(
            onTap: () => print("default button"),
          ),
          AgButton(
            onTap: () => print("secondary button"),
            buttonText: "secondary button",
            buttonType: AgButtonType.secondary,
          ),
          Center(child: Text("Login page")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, HomePage.routeName);
          },
          child: Text("+")),
    );
  }
}

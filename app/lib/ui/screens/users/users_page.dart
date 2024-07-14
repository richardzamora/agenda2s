import 'package:agenda2/ui/helpers/single_page_template.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  static String routeName = "/users";
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SinglePageTemplate(routeName,
        body: Center(child: Text("Users page")));
  }
}

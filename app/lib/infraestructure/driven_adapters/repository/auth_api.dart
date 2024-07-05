import 'package:agenda2/domain/gateway/auth_gateway.dart';
import 'package:agenda2/domain/models/user.dart';
import 'package:agenda2/infraestructure/notifiers/session_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class AuthApi implements AuthGateway {
  AuthApi(BuildContext context) {
    _sessionProvider = Provider.of<SessionNotifier>(context, listen: false);
  }

  late SessionNotifier _sessionProvider;

  @override
  Future<User> authenticate(String email, String pass) async {
    const baseApi = 'https://agenda2.up.railway.app/';
    final response = await http.Client().post(Uri.parse('${baseApi}auth/login'),
        body: {"username": email, "password": pass},
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final user = userFromJson(response.body);
      _sessionProvider.setUserData(user);
      return user;
    }
    _sessionProvider.setUserData(null);
    return User();
  }
}

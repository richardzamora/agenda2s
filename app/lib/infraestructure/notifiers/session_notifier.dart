import 'package:flutter/material.dart';

import '../../agenda2.dart';

class SessionNotifier with ChangeNotifier {
  AuthSession? _loggedInUser;

  AuthSession? get loggedInUser => _loggedInUser;

  void setSessionData(AuthSession? session) {
    _loggedInUser = session;
    notifyListeners();
  }

  void deleteSessionData() {
    _loggedInUser = null;
    notifyListeners();
  }
}

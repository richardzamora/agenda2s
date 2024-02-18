import 'package:flutter/material.dart';

import '../../agenda2.dart';

class SessionNotifier with ChangeNotifier {
  User? _loggedInUser;

  User? get loggedInUser => _loggedInUser;

  void setUserData(User user) {
    _loggedInUser = user;
    notifyListeners();
  }

  void deleteSessionData() {
    _loggedInUser = null;
    notifyListeners();
  }
}

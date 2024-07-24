import 'package:flutter/material.dart';

import '../../agenda2.dart';

class SessionNotifier with ChangeNotifier {
  Session? _loggedInUser;

  Session? get loggedInUser => _loggedInUser;

  void setSessionData(Session? session) {
    _loggedInUser = session;
    notifyListeners();
  }

  void deleteSessionData() {
    _loggedInUser = null;
    notifyListeners();
  }
}

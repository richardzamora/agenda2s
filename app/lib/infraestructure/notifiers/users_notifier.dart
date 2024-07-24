import 'package:agenda2/domain/models/user.dart';
import 'package:flutter/material.dart';

class UsersNotifier with ChangeNotifier {
  List<User>? _usersList;

  List<User>? get usersList => _usersList;

  void setUsersList(List<User>? users) {
    _usersList = users;
    notifyListeners();
  }

  void clearUsersData() {
    _usersList = null;
    notifyListeners();
  }
}

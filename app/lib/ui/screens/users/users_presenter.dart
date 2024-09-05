import 'package:agenda2/agenda2.dart';
import 'package:agenda2/ui/screens/users/users_interface.dart';

class UsersPresenter {
  UsersPresenter(this._userGateway, this._usersInterface);
  final UserGateway _userGateway;
  final UsersInterface _usersInterface;

  void getUsers() async {
    _usersInterface.showLoading();
    final response = await _userGateway.getUsers();
    _usersInterface.hideLoading();
    response.either(
      (left) => print(left.message),
      (right) => print(right.toString()),
    );
  }
}

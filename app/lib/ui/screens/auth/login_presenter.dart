import 'package:agenda2/domain/gateway/auth_gateway.dart';
import 'package:agenda2/ui/screens/auth/login_interface.dart';

class LoginPresenter {
  LoginPresenter(this._authGateway, this._loginInterface);
  final AuthGateway _authGateway;
  final LoginInterface _loginInterface;

  void onLogin(String email, String password) async {
    _loginInterface.showLoading();
    final response = await _authGateway.authenticate(email, password);
    _loginInterface.hideLoading();
    response.either(
      (left) => print(left.message),
      (right) => _loginInterface.onLoginSuccess(),
    );
  }
}

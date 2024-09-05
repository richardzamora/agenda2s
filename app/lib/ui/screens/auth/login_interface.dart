import 'package:agenda2/agenda2.dart';

abstract class LoginInterface {
  void showLoading();
  void hideLoading();
  void onLoginSuccess();
  void showError(AppError error);
}

import 'package:agenda2/agenda2.dart';

abstract class UsersInterface {
  void showLoading();
  void hideLoading();
  void showError(AppError error);
}

import 'package:agenda2/agenda2.dart';

abstract class SessionInterface {
  void showLoading();
  void hideLoading();
  void showError(AppError error);
}

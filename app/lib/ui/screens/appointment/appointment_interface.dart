import 'package:agenda2/agenda2.dart';

abstract class AppointmentInterface {
  void showLoading();
  void hideLoading();
  void showError(AppError error);
}

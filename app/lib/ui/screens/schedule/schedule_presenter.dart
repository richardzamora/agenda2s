import 'package:agenda2/agenda2.dart';
import 'package:agenda2/ui/screens/schedule/schedule_interface.dart';
import 'package:agenda2/ui/screens/users/users_interface.dart';

class SchedulePresenter {
  SchedulePresenter(this._scheduleGateway, this._scheduleInterface);
  final ScheduleGateway _scheduleGateway;
  final ScheduleInterface _scheduleInterface;

  void getSchedules() async {
    _scheduleInterface.showLoading();
    final response = await _scheduleGateway.getSchedules();
    _scheduleInterface.hideLoading();
    response.either(
      (left) => print(left.message),
      (right) => print(right.toString()),
    );
  }
}

import 'package:agenda2/agenda2.dart';
import 'package:agenda2/ui/screens/appointment/appointment_interface.dart';

class AppointmentPresenter {
  AppointmentPresenter(
      this._scheduleGateway, this._sessionGateway, this._appointmentInterface);
  final ScheduleGateway _scheduleGateway;
  final SessionGateway _sessionGateway;
  final AppointmentInterface _appointmentInterface;

  void getSchedules() async {
    _appointmentInterface.showLoading();
    final response = await _scheduleGateway.getSchedules();
    _appointmentInterface.hideLoading();
    response.either(
      (left) => print(left.message),
      (right) => _appointmentInterface.updateSchedulesAviable(right),
    );
  }

  void getSessionsBySchedule(Schedule schedule) async {
    _appointmentInterface.showLoading();
    final response = await _sessionGateway.getSessionsBySchedule(schedule);
    _appointmentInterface.hideLoading();
    response.either(
      (left) => print(left.message),
      (right) => _appointmentInterface.updateSessionsAviable(right),
    );
  }

  void clearSessions() {
    _appointmentInterface.updateSessionsAviable(null);
  }
}

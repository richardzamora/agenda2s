import 'package:agenda2/domain/models/schedule.dart';
import 'package:flutter/material.dart';

class ScheduleNotifier with ChangeNotifier {
  List<Schedule>? _scheduleList;

  List<Schedule>? get scheduleList => _scheduleList;

  void setScheduleList(List<Schedule>? schedule) {
    _scheduleList = schedule;
    notifyListeners();
  }

  void clearscheduleData() {
    _scheduleList = null;
    notifyListeners();
  }
}

import 'package:agenda2/agenda2.dart';
import 'package:agenda2/ui/screens/appointment/appointment_presenter.dart';
import 'package:agenda2/ui/screens/appointment/widgets/create/sessions_aviable_widget.dart';
import 'package:flutter/material.dart';

import 'create/schedules_aviable_widget.dart';
import 'create/selected_schedule_widget.dart';
import 'create/selected_session_widget.dart';

class CreateAppointmentView extends StatefulWidget {
  const CreateAppointmentView({
    super.key,
    required this.scheduleList,
    required this.sessionList,
    required this.presenter,
  });

  final List<Schedule>? scheduleList;
  final List<Session>? sessionList;
  final AppointmentPresenter presenter;

  @override
  State<CreateAppointmentView> createState() => _CreateAppointmentViewState();
}

class _CreateAppointmentViewState extends State<CreateAppointmentView> {
  Schedule? selectedSchedule;
  Session? selectedSession;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        if (selectedSchedule == null)
          SchedulesAviableWidget(
            scheduleList: widget.scheduleList ?? [],
            onSelect: (schedule) => setState(() {
              selectedSchedule = schedule;
              widget.presenter.getSessionsBySchedule(schedule);
            }),
          ),
        if (selectedSchedule != null)
          SelectedScheduleWidget(
            selectedSchedule: selectedSchedule,
            onDelete: () => setState(() {
              selectedSchedule = null;
              widget.presenter.clearSessions();
              selectedSession = null;
            }),
          ),
        if (widget.sessionList != null && selectedSession == null)
          SessionsAviableWidget(
            sessionList: widget.sessionList!,
            onSelect: (session) => setState(() => selectedSession = session),
          ),
        if (selectedSession != null)
          SelectedSessionWidget(
            session: selectedSession!,
            onDelete: () => setState(() => selectedSession = null),
          ),
      ],
    );
  }
}

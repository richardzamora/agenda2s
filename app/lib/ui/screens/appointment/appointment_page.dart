import 'package:agds/agds.dart';
import 'package:agenda2/agenda2.dart';
import 'package:agenda2/ui/helpers/single_page_template.dart';
import 'package:agenda2/ui/screens/appointment/appointment_interface.dart';
import 'package:agenda2/ui/screens/appointment/appointment_presenter.dart';
import 'package:agenda2/ui/screens/appointment/widgets/create_appointment_view.dart';
import 'package:agenda2/ui/screens/appointment/widgets/list_appointment_view.dart';
import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  static String routeName = "/appointment";
  const AppointmentPage(
      {required this.scheduleGateway, required this.sessionGateway, Key? key})
      : super(key: key);

  final ScheduleGateway scheduleGateway;
  final SessionGateway sessionGateway;

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage>
    implements AppointmentInterface {
  late AppointmentPresenter presenter;
  String pageContent = 'Listar';
  List<Schedule>? schedulesList;
  List<Session>? sessionsList;

  @override
  void initState() {
    presenter = AppointmentPresenter(
        widget.scheduleGateway, widget.sessionGateway, this);
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => presenter.getSchedules());
  }

  @override
  Widget build(BuildContext context) {
    final List<Appointment> appointmentList = [
      Appointment(
          id: '123123123',
          sessionDescription:
              'Introducción a Java. Tipos de dato, condicionales y bucles',
          date: DateTime(2024, 09, 23, 18),
          placeName: 'Virtual'),
    ];

    return SinglePageTemplate(
      AppointmentPage.routeName,
      title: 'Gestionar citas',
      body: Column(
        children: [
          AgListButtons(
              elements: ['Listar', 'Solicitar'],
              defaultElement: 'Listar',
              onTapElement: (value) {
                setState(() {
                  pageContent = value;
                });
              }),
          const SizedBox(height: 12),
          SizedBox(
              width: 450,
              child: pageContent.contains('Listar')
                  ? ListAppointmentView(appointmentList: appointmentList)
                  : CreateAppointmentView(
                      scheduleList: schedulesList,
                      sessionList: sessionsList,
                      presenter: presenter)),
        ],
      ),
    );
  }

  @override
  void hideLoading() {
    // TODO: implement hideLoading
  }

  @override
  void showError(AppError error) {
    // TODO: implement showError
  }

  @override
  void showLoading() {
    // TODO: implement showLoading
  }

  @override
  void getSchedules() {
    // TODO: implement getSchedules
  }

  @override
  void updateSchedulesAviable(List<Schedule> schedules) {
    setState(() {
      schedulesList = schedules;
    });
  }

  @override
  void updateSessionsAviable(List<Session>? sessions) {
    setState(() {
      sessionsList = sessions;
    });
  }
}

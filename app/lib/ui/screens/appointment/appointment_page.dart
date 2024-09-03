import 'package:agds/agds.dart';
import 'package:agenda2/agenda2.dart';
import 'package:agenda2/domain/models/appointment.dart';
import 'package:agenda2/ui/helpers/single_page_template.dart';
import 'package:agenda2/ui/screens/appointment/appointment_interface.dart';
import 'package:agenda2/ui/screens/appointment/appointment_presenter.dart';
import 'package:agenda2/ui/screens/appointment/widgets/create_appointment_view.dart';
import 'package:agenda2/ui/screens/appointment/widgets/list_appointment_view.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/category.dart';
import '../../../domain/models/schedule.dart';

class AppointmentPage extends StatefulWidget {
  static String routeName = "/appointment";
  const AppointmentPage({required this.scheduleGateway, Key? key})
      : super(key: key);

  final ScheduleGateway scheduleGateway;

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage>
    implements AppointmentInterface {
  late AppointmentPresenter presenter;
  String pageContent = 'Listar';

  @override
  void initState() {
    presenter = AppointmentPresenter(widget.scheduleGateway, this);
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => presenter.getSchedules());
  }

  @override
  Widget build(BuildContext context) {
    // final scheduleList = Provider.of<ScheduleNotifier>(context).scheduleList;
    final List<Appointment> appointmentList = [
      Appointment(
          id: '123123123',
          description: 'xxxxxx',
          sessionDescription: 'Introducción a Springboot',
          date: DateTime.now(),
          placeName: 'Virtual'),
    ];
    final List<Schedule> scheduleList = [
      Schedule(
          id: '123123123',
          title: 'Springboot intermedio',
          professionalId: 'Ezequiel',
          categories: [
            Category(
                id: '2134981724',
                name: 'Prog. orientada a objetos',
                isMandatory: true),
            Category(id: '2134981725', name: 'java básico', isMandatory: true),
            Category(
                id: '34981726', name: 'java intermedio', isMandatory: false),
          ]),
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
                  : CreateAppointmentView(scheduleList: scheduleList)),
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
}

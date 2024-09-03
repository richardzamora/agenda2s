import 'package:agds/agds.dart';
import 'package:agenda2/agenda2.dart';
import 'package:agenda2/ui/helpers/single_page_template.dart';
import 'package:agenda2/ui/screens/schedule/schedule_interface.dart';
import 'package:agenda2/ui/screens/schedule/schedule_presenter.dart';
import 'package:agenda2/ui/screens/session_class/session_interface.dart';
import 'package:agenda2/ui/screens/session_class/session_presenter.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/schedule.dart';
import 'widgets/create_session_view.dart';
import 'widgets/list_session_view.dart';

class SessionPage extends StatefulWidget {
  static String routeName = "/session";
  const SessionPage({required this.scheduleGateway, Key? key})
      : super(key: key);

  final ScheduleGateway scheduleGateway;

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> implements SessionInterface {
  late SessionPresenter presenter;
  String pageContent = 'Listar';

  @override
  void initState() {
    presenter = SessionPresenter(widget.scheduleGateway, this);
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => presenter.getSchedules());
  }

  @override
  Widget build(BuildContext context) {
    // final scheduleList = Provider.of<ScheduleNotifier>(context).scheduleList;
    final List<Schedule> scheduleList = [
      Schedule(
          id: '123123123',
          title: 'Programación orientada a Objetos',
          professionalId: 'Richard')
    ];
    return SinglePageTemplate(
      SessionPage.routeName,
      title: 'Gestionar Sesiones',
      body: Column(
        children: [
          AgListButtons(
              elements: ['Listar', 'Crear'],
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
                ? ListSessionView(scheduleList: scheduleList)
                : const CreateSessionView(),
          ),
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
}

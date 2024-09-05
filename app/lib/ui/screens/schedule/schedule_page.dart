import 'package:agds/agds.dart';
import 'package:agenda2/agenda2.dart';
import 'package:agenda2/domain/models/category.dart';
import 'package:agenda2/infraestructure/notifiers/schedule_notifier.dart';
import 'package:agenda2/ui/helpers/single_page_template.dart';
import 'package:agenda2/ui/screens/schedule/schedule_interface.dart';
import 'package:agenda2/ui/screens/schedule/schedule_presenter.dart';
import 'package:agenda2/ui/screens/schedule/widgets/list_schedule_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/schedule.dart';
import 'widgets/create_schedule_view.dart';

class SchedulePage extends StatefulWidget {
  static String routeName = "/schedule";
  const SchedulePage({required this.scheduleGateway, Key? key})
      : super(key: key);

  final ScheduleGateway scheduleGateway;

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
    implements ScheduleInterface {
  late SchedulePresenter presenter;
  String pageContent = 'Listar';

  @override
  void initState() {
    presenter = SchedulePresenter(widget.scheduleGateway, this);
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
      SchedulePage.routeName,
      title: 'Gestionar agenda',
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
                ? ListScheduleView(scheduleList: scheduleList)
                : const CreateScheduleView(),
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

import 'package:agenda2/domain/models/category.dart';

import '../../../domain/models/schedule.dart';

class ScheduleApiMock {
  static final List<Schedule> scheduleListMock = [
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
          Category(id: '34981726', name: 'java intermedio', isMandatory: false),
        ]),
    Schedule(
        id: '123123123',
        title: 'Introducción a Java',
        professionalId: 'Ezequiel',
        categories: [
          Category(
              id: '2134981724',
              name: 'Prog. orientada a objetos',
              isMandatory: false),
          Category(id: '2134981725', name: 'java básico', isMandatory: false),
        ]),
    Schedule(
        id: '123123123',
        title: 'Introducción a Flutter',
        professionalId: 'Richard',
        categories: [
          Category(
              id: '2134981724',
              name: 'Prog. orientada a objetos',
              isMandatory: false),
          Category(
              id: '2134981725', name: 'flutter básico', isMandatory: false),
        ]),
  ];
}

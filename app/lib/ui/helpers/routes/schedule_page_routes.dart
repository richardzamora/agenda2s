import 'package:agenda2/infraestructure/driven_adapters/repository/schedule_api.dart';
import 'package:flutter/material.dart';

import '../../screens/schedule/schedule_page.dart';

class SchedulePageRoutes {
  SchedulePageRoutes._();

  static SchedulePage getSchedulePage(BuildContext context) => SchedulePage(
        scheduleGateway: ScheduleApi(context),
      );
}

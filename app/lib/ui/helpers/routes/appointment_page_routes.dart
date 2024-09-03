import 'package:agenda2/infraestructure/driven_adapters/repository/schedule_api.dart';
import 'package:flutter/material.dart';

import '../../screens/appointment/appointment_page.dart';

class AppointmentPageRoutes {
  AppointmentPageRoutes._();

  static AppointmentPage getAppointmentPage(BuildContext context) =>
      AppointmentPage(
        scheduleGateway: ScheduleApi(context),
      );
}

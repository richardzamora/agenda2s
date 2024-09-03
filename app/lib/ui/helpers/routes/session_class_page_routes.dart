import 'package:agenda2/infraestructure/driven_adapters/repository/schedule_api.dart';
import 'package:agenda2/ui/screens/session_class/session_page.dart';
import 'package:flutter/material.dart';

class SessionClassPageRoutes {
  SessionClassPageRoutes._();

  static SessionPage getSessionPage(BuildContext context) => SessionPage(
        scheduleGateway: ScheduleApi(context),
      );
}

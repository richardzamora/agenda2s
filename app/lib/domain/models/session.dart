import 'package:agenda2/agenda2.dart';

class Session {
  Session({
    this.id,
    this.profesional,
    this.description,
    this.place,
    this.date,
    this.usersLimit,
    this.schedule,
  });

  String? id;
  String? profesional;
  String? description;
  String? place;
  DateTime? date;
  int? usersLimit;
  Schedule? schedule;
}

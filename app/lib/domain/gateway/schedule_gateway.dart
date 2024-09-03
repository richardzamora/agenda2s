import 'package:agenda2/domain/models/schedule.dart';
import 'package:either_dart/either.dart';

import '../../agenda2.dart';

abstract class ScheduleGateway {
  Future<Either<AppError, List<Schedule>>> getSchedules();
}

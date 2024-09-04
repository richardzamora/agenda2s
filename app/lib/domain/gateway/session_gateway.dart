import 'package:either_dart/either.dart';

import '../../agenda2.dart';

abstract class SessionGateway {
  Future<Either<AppError, List<Session>>> getSessionsBySchedule(
      Schedule schedule);
}

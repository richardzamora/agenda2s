import 'package:agenda2/domain/models/user.dart';
import 'package:either_dart/either.dart';

import '../models/app_error.dart';

abstract class UserGateway {
  Future<Either<AppError, List<User>>> getUsers();
}

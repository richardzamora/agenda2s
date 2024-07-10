import 'package:either_dart/either.dart';

import '../../agenda2.dart';

abstract class AuthGateway {
  Future<Either<AppError, User>> authenticate(String email, String pass);
}

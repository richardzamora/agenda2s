import 'package:either_dart/either.dart';

import '../../agenda2.dart';

abstract class AuthGateway {
  Future<Either<AppError, AuthSession>> authenticate(String email, String pass);
}

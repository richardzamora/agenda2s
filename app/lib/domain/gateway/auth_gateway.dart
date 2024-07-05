import '../../agenda2.dart';

abstract class AuthGateway {
  Future<User> authenticate(String email, String pass);
}

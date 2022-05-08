import 'package:measurement/app/modules/external/auth_service/implementations/auth_service_imp.dart';

abstract class AuthService {
  Future<void> createUser(String name, String email, String password);
  Future<IResponseAuth> authenticateUser(String email, String password);
  Future<Map<String, dynamic>> getUser(String token);
}

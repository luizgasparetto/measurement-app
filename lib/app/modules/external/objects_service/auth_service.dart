import 'package:measurement/app/modules/external/objects_service/implementations/auth_service_imp.dart';

abstract class AuthService {
  Future<void> createUser(String name, String email, String password);
  Future<IResponseAuth> authenticateUser(String email, String password);
}

import 'package:measurement/app/modules/domain/repositories/auth_repository.dart';
import 'package:measurement/app/modules/external/auth_service/auth_service.dart';
import 'package:measurement/app/modules/external/auth_service/implementations/prefs_service_imp.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthService authService;

  AuthRepositoryImp(this.authService);

  @override
  Future<void> signUp(String name, String email, String password) async {
    await authService.createUser(name, email, password);
  }

  @override
  Future<String> authenticateUser(String email, String password) async {
    final authResponse = await authService.authenticateUser(email, password);

    await PrefsServiceImp.saveUser(authResponse.token);

    return authResponse.token;
  }
}

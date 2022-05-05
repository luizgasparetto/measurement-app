import 'package:measurement/app/modules/domain/repositories/auth_repository.dart';
import 'package:measurement/app/modules/external/objects_service/auth_service.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthService authService;

  AuthRepositoryImp(this.authService);

  @override
  Future<void> signUp(String name, String email, String password) async {
    await authService.createUser(name, email, password);
  }
}

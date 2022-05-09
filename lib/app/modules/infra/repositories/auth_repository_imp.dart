import 'package:measurement/app/modules/domain/entities/user_entity.dart';
import 'package:measurement/app/modules/domain/repositories/auth_repository.dart';
import 'package:measurement/app/modules/external/auth_service/auth_service.dart';
import 'package:measurement/app/modules/external/shared_pref_service/prefs_service_imp.dart';
import 'package:measurement/app/modules/infra/dtos/user_dto.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthService authService;

  AuthRepositoryImp(this.authService);

  @override
  Future<void> createUser(String name, String email, String password) async {
    await authService.createUser(name, email, password);
  }

  @override
  Future<String> authenticateUser(String email, String password) async {
    final authResponse = await authService.authenticateUser(email, password);

    await PrefsServiceImp.saveUserToken(authResponse.token);

    return authResponse.token;
  }

  @override
  Future<UserEntity> getUser() async {
    final token = await PrefsServiceImp.getToken();

    final userData = await authService.getUser(token);
    final userDTO = UserDTO.fromMap(userData);

    return userDTO;
  }
}

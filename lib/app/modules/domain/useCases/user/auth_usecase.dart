import 'package:measurement/app/modules/domain/entities/user_entity.dart';
import 'package:measurement/app/modules/domain/repositories/auth_repository.dart';
import 'package:measurement/app/modules/infra/exceptions/auth_errors.dart';

class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase(this.authRepository);

  Future<void> createUser(String name, String email, String password) async {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      throw AuthException.fromCode('missing-fields');
    }

    if (!email.contains("@")) {
      throw AuthException.fromCode('invalid-email');
    }

    try {
      await authRepository.createUser(name, email, password);
    } catch (e) {
      throw AuthException.fromCode('user-exist');
    }
  }

  Future<String> authenticateUser(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw AuthException.fromCode('missing-fields');
    }

    if (!email.contains("@")) {
      throw AuthException.fromCode('invalid-email');
    }

    try {
      return await authRepository.authenticateUser(email, password);
    } catch (e) {
      throw AuthException.fromCode('invalid-credentials');
    }
  }

  Future<UserEntity> getUser() async {
    return await authRepository.getUser();
  }
}

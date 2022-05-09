import 'package:measurement/app/modules/domain/entities/user_entity.dart';
import 'package:measurement/app/modules/domain/repositories/auth_repository.dart';
import 'package:measurement/app/modules/infra/exceptions/auth_errors.dart';

class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase(this.authRepository);

  //   if (name.isEmpty || email.isEmpty || password.isEmpty) {
  //   throw AuthException.fromCode('missing-fields');
  // }

  // if (!email.contains("@")) {
  //   throw AuthException.fromCode('invalid-email');
  // }

  Future<String> authenticateUser(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw AuthException.fromCode('missing-fields');
    }

    return await authRepository.authenticateUser(email, password);
  }

  Future<UserEntity> getUser() async {
    return await authRepository.getUser();
  }
}

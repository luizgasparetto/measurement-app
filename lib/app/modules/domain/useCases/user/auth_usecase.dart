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

    await authRepository.signUp(name, email, password);
  }
}

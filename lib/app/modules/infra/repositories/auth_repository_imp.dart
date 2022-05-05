import 'package:measurement/app/modules/domain/repositories/auth_repository.dart';
import 'package:measurement/app/modules/external/objects_service/auth_service.dart';
import 'package:measurement/app/modules/presentation/ui/pages/auth/login_page.dart';
import 'package:measurement/app/modules/presentation/ui/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthService authService;
  final SharedPreferences pref;

  AuthRepositoryImp(this.authService, this.pref);

  @override
  Future<void> signUp(String name, String email, String password) async {
    await authService.createUser(name, email, password);
  }

  @override
  Future<void> authenticateUser(String email, String password) async {
    final authResponse = await authService.authenticateUser(email, password);

    await pref.setString('token', authResponse.token);
  }

  @override
  Future<String> isAuthenticated() async {
    final token = pref.getString('token');

    return token == null ? LoginPage.routeName : HomePage.routeName;
  }
}

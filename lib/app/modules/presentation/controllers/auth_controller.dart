import 'package:measurement/app/modules/external/auth_service/implementations/prefs_service_imp.dart';
import 'package:measurement/app/modules/presentation/blocs/auth/auth_bloc.dart';

class AuthController {
  final AuthBloc authBloc;

  AuthController(this.authBloc);

  Future<bool> signIn(String email, String password) async {
    authBloc.add(
      AuthSignInEvent(
        email: email,
        password: password,
      ),
    );

    return await PrefsServiceImp.isAuth();
  }
}

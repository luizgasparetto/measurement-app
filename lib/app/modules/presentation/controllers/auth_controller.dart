import 'package:measurement/app/modules/external/shared_pref_service/prefs_service_imp.dart';
import 'package:measurement/app/modules/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:measurement/app/modules/presentation/blocs/user_bloc/user_bloc.dart';

class AuthController {
  final AuthBloc authBloc;
  final UserBloc userBloc;

  AuthController(this.authBloc, this.userBloc);

  Future<bool> signIn(String email, String password) async {
    authBloc.add(
      AuthSignInEvent(
        email: email,
        password: password,
      ),
    );

    // userBloc.add(GetUserInformationEvent());

    return await PrefsServiceImp.isAuth();
  }
}

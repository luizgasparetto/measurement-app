import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:measurement/app/modules/domain/useCases/user/auth_usecase.dart';
import 'package:measurement/app/modules/external/shared_pref_service/prefs_service_imp.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase authUseCase;

  AuthBloc(this.authUseCase) : super(AuthLoadingState()) {
    on<AuthSignInEvent>((event, emit) async {
      try {
        final token =
            await authUseCase.authenticateUser(event.email, event.password);

        if (token.isNotEmpty) {
          await PrefsServiceImp.saveUserToken(token);
          final authResult = await PrefsServiceImp.isAuth();
          emit(AuthSignInState(authResult));
        }
      } catch (e) {
        emit(AuthErrorState());
      }
    });
  }
}
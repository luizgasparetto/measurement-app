import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:measurement/app/modules/domain/useCases/user/auth_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase authUseCase;

  AuthBloc(this.authUseCase) : super(AuthLoadingState()) {
    on<AuthSignUpEvent>((event, emit) async {
      try {
        await authUseCase.createUser(event.name, event.email, event.password);
      } catch (e) {
        emit(AuthErrorState());
      }
    });

    on<AuthSignInEvent>((event, emit) async {
      try {
        await authUseCase.authenticateUser(event.email, event.password);
        emit(AuthSignInState());
      } catch (e) {
        emit(AuthErrorState());
      }
    });
  }
}

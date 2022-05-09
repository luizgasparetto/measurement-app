import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:measurement/app/modules/domain/entities/user_entity.dart';
import "dart:developer" as dev;

import 'package:measurement/app/modules/domain/useCases/user/auth_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthUseCase authUseCase;

  UserBloc(this.authUseCase) : super(UserLoadingState()) {
    on<GetUserInformationEvent>((event, emit) async {
      try {
        final user = await authUseCase.getUser();
        emit(UserLoadedState(user));
      } catch (e, st) {
        emit(UserErrorState());
        dev.log("ERRO LOAD USER", error: e, stackTrace: st);
      }
    });
  }
}

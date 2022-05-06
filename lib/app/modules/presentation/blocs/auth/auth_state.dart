part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthLoadingState extends AuthState {}

class AuthSignInState extends AuthState {
  final bool authResult;

  const AuthSignInState(this.authResult);

  @override
  List<Object> get props => [authResult];
}

class AuthErrorState extends AuthState {}

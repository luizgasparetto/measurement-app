part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthLoadingState extends AuthState {}

class AuthSignUpState extends AuthState {}

class AuthSignInState extends AuthState {}

class AuthErrorState extends AuthState {}

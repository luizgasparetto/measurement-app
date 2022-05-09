part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthSignInEvent extends AuthEvent {
  final String email, password;

  const AuthSignInEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

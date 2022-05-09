part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final UserEntity user;

  const UserLoadedState(this.user);

  @override
  List<Object> get props => [user];
}

class UserErrorState extends UserState {}

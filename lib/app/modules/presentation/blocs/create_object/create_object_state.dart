part of 'create_object_bloc.dart';

abstract class CreateObjectState extends Equatable {
  const CreateObjectState();

  @override
  List<Object> get props => [];
}

class CreateObjectLoadingState extends CreateObjectState {}

class CreateObjectCreatedState extends CreateObjectState {}

class CreateObjectErrorState extends CreateObjectState {}

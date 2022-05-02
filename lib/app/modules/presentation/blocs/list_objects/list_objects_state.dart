part of 'list_objects_bloc.dart';

abstract class ListObjectsState extends Equatable {
  const ListObjectsState();

  @override
  List<Object> get props => [];
}

class ListObjectsLoadingState extends ListObjectsState {}

class ListObjectsLoadedState extends ListObjectsState {
  final List<ObjectEntity> objects;

  const ListObjectsLoadedState(this.objects);

  @override
  List<Object> get props => [objects];
}

class ListObjectsErrorState extends ListObjectsState {}

part of 'list_objects_bloc.dart';

abstract class ListObjectsEvent extends Equatable {
  const ListObjectsEvent();

  @override
  List<Object> get props => [];
}

class GetObjectsEvent extends ListObjectsEvent {}

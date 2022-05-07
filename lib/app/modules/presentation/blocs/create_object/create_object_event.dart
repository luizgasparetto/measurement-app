part of 'create_object_bloc.dart';

abstract class CreateObjectEvent extends Equatable {
  const CreateObjectEvent();

  @override
  List<Object> get props => [];
}

class UploadObjectEvent extends CreateObjectEvent {
  final File file;

  const UploadObjectEvent(this.file);

  @override
  List<Object> get props => [file];
}

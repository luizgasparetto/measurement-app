import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:measurement/app/modules/domain/entities/object_entity.dart';
import 'package:measurement/app/modules/domain/useCases/objects/objects_usecase.dart';

part 'list_objects_event.dart';
part 'list_objects_state.dart';

class ListObjectsBloc extends Bloc<ListObjectsEvent, ListObjectsState> {
  final ObjectsUseCase objectsUseCase;

  ListObjectsBloc(this.objectsUseCase) : super(ListObjectsLoadingState()) {
    //
    on<GetObjectsEvent>((event, emit) async {
      try {
        final objects = await objectsUseCase.getObjects();
        emit(ListObjectsLoadedState(objects));
      } catch (e) {
        emit(ListObjectsErrorState());
      }
    });
  }
}

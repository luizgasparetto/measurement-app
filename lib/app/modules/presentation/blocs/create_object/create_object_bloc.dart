import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:measurement/app/modules/domain/useCases/objects/objects_usecase.dart';
import "dart:developer" as dev;

part 'create_object_event.dart';
part 'create_object_state.dart';

class CreateObjectBloc extends Bloc<CreateObjectEvent, CreateObjectState> {
  final ObjectsUseCase objectsUseCase;

  CreateObjectBloc(this.objectsUseCase) : super(CreateObjectLoadingState()) {
    on<UploadObjectEvent>((event, emit) async {
      try {
        await objectsUseCase.createObjects(event.file);
        emit(CreateObjectCreatedState());
      } on DioErrorType catch (e, st) {
        dev.log("UPLOAD IMAGE ERROR", error: e.name, stackTrace: st);
      }
    });
  }
}

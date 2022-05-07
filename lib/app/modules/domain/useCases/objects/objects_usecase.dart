import 'dart:io';

import 'package:measurement/app/modules/domain/entities/object_entity.dart';
import 'package:measurement/app/modules/domain/repositories/objects_repositories.dart';

class ObjectsUseCase {
  final ObjectsRepository objectsRepository;

  ObjectsUseCase(this.objectsRepository);

  Future<List<ObjectEntity>> getObjects() async {
    final objects = await objectsRepository.list();

    return objects.isEmpty ? [] : objects;
  }

  Future<void> createObjects(File file) async {
    return await objectsRepository.create(file);
  }
}

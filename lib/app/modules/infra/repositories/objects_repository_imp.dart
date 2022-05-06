import 'dart:convert';

import 'package:measurement/app/modules/domain/entities/object_entity.dart';
import 'package:measurement/app/modules/domain/repositories/objects_repositories.dart';
import 'package:measurement/app/modules/external/objects_service/objects_service.dart';
import 'package:measurement/app/modules/infra/dtos/object_dto.dart';

class ObjectsRepositoryImp implements ObjectsRepository {
  final ObjectsService objectsServiceImp;

  ObjectsRepositoryImp(this.objectsServiceImp);

  @override
  Future<void> create(String urlImage) async {}

  @override
  Future<List<ObjectEntity>> list() async {
    final objectsData = await objectsServiceImp.getObjects();

    final objectsJson = jsonDecode(objectsData) as List;

    return objectsJson.map((object) => ObjectDTO.fromMap(object)).toList();
  }
}

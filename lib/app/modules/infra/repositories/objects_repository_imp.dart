import 'dart:io';

import 'package:dio/dio.dart';
import 'package:measurement/app/modules/domain/entities/object_entity.dart';
import 'package:measurement/app/modules/domain/repositories/objects_repositories.dart';
import 'package:measurement/app/modules/external/shared_pref_service/prefs_service_imp.dart';
import 'package:measurement/app/modules/external/objects_service/objects_service.dart';
import 'package:measurement/app/modules/infra/dtos/object_dto.dart';
import "package:http_parser/http_parser.dart";
import "dart:developer" as dev;

class ObjectsRepositoryImp implements ObjectsRepository {
  final ObjectsService objectsServiceImp;

  ObjectsRepositoryImp(this.objectsServiceImp);

  @override
  Future<void> create(File file) async {
    try {
      final token = await PrefsServiceImp.getToken();

      String fileName = file.path.split('/').last;

      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
          contentType: MediaType("image", "jpeg"),
        ),
      });

      await objectsServiceImp.createObject(formData, token);
    } on DioErrorType catch (e, st) {
      dev.log("ERROR OBJECT", error: e.name, stackTrace: st);
    }
  }

  @override
  Future<List<ObjectEntity>> list() async {
    final objectsData = await objectsServiceImp.getObjects();
    final objectsListJson = objectsData.data as List;

    return objectsListJson.map((object) => ObjectDTO.fromMap(object)).toList();
  }
}

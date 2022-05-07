import 'dart:io';

import 'package:measurement/app/modules/domain/entities/object_entity.dart';

abstract class ObjectsRepository {
  Future<void> create(File file);
  Future<List<ObjectEntity>> list();
}

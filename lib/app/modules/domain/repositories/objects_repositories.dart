import 'package:measurement/app/modules/domain/entities/object_entity.dart';

abstract class ObjectsRepository {
  Future<void> create(String urlImage);
  Future<List<ObjectEntity>> list();
}

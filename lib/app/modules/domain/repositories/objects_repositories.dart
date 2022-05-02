import 'package:measurement/app/modules/domain/entities/object_entity.dart';

abstract class ObjectsRepository {
  Future<void> create(double width, double height);
  Future<List<ObjectEntity>> list();
}

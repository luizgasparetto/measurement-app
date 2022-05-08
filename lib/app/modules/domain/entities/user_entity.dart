import 'package:measurement/app/modules/domain/entities/object_entity.dart';

class UserEntity {
  final String id;
  final String name;
  final String email;
  final String password;
  final List<ObjectEntity> objects;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.objects,
  });
}

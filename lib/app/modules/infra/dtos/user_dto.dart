// ignore_for_file: overridden_fields, annotate_overrides

import 'package:measurement/app/modules/domain/entities/object_entity.dart';
import 'package:measurement/app/modules/domain/entities/user_entity.dart';
import 'package:measurement/app/modules/infra/dtos/object_dto.dart';

class UserDTO extends UserEntity {
  final String id;
  final String name;
  final String email;
  final String password;
  final List<ObjectEntity> objects;

  UserDTO({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.objects,
  }) : super(
          id: id,
          name: name,
          email: email,
          password: password,
          objects: objects,
        );

  factory UserDTO.fromMap(Map<String, dynamic> map) {
    return UserDTO(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      objects: List<ObjectEntity>.from(
          map['objects']?.map((x) => ObjectDTO.fromMap(x))),
    );
  }
}

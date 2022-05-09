// ignore_for_file: overridden_fields, annotate_overrides

import 'package:measurement/app/modules/domain/entities/user_entity.dart';

class UserDTO extends UserEntity {
  final String id;
  final String name;
  final String email;

  UserDTO({
    required this.id,
    required this.name,
    required this.email,
  }) : super(
          id: id,
          name: name,
          email: email,
        );

  factory UserDTO.fromMap(Map<String, dynamic> map) {
    return UserDTO(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }
}

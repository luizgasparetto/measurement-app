// ignore_for_file: annotate_overrides, overridden_fields

import 'package:measurement/app/modules/domain/entities/object_entity.dart';

class ObjectDTO extends ObjectEntity {
  final String id;
  final double width;
  final double height;
  final String imgURL;

  ObjectDTO({
    required this.id,
    required this.width,
    required this.height,
    required this.imgURL,
  }) : super(
          id: id,
          width: width,
          height: height,
          imageUrl: imgURL,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'width': width,
      'height': height,
      'imgURL': imgURL,
    };
  }

  factory ObjectDTO.fromMap(Map<String, dynamic> map) {
    return ObjectDTO(
      id: map['id'] ?? '',
      width: map['width']?.toDouble() ?? 0.0,
      height: map['height']?.toDouble() ?? 0.0,
      imgURL: map['image_url'] ?? '',
    );
  }
}

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:measurement/app/modules/domain/repositories/camera_repository.dart';

import "dart:developer" as dev;

class CameraRepositoryImp implements CameraRepository {
  final _image = ValueNotifier<XFile?>(null);

  @override
  Future<void> selectImage() async {
    try {
      XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
      if (file != null) {
        _image.value = file;
      }
    } catch (e, st) {
      dev.log("ERROR IMAGE", error: e, stackTrace: st);
    }
  }

  @override
  ValueNotifier<XFile?> get image => _image;
}

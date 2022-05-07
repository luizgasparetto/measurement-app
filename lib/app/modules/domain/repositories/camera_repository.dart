import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

abstract class CameraRepository {
  Future<void> selectImage();
  ValueNotifier<XFile?> get image;
}

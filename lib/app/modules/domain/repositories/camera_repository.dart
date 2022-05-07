import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

abstract class CameraRepository {
  Future<void> selectImage(ImageSource imageSource);
  ValueNotifier<XFile?> get image;
}

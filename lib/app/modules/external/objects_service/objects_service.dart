import 'package:dio/dio.dart';

abstract class ObjectsService {
  Future<Response<dynamic>> getObjects();
  Future<void> createObject(FormData formData, String token);
}

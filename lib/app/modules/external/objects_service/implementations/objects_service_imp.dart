import 'package:dio/dio.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../objects_service.dart';

class ObjectsServiceImp implements ObjectsService {
  final String urlAPI = dotenv.env["API_URL"]!;
  //final Client http;
  final Dio dio;

  ObjectsServiceImp(this.dio);

  @override
  Future<Response<dynamic>> getObjects() async {
    return await dio.get('$urlAPI/objects');
  }

  @override
  Future<void> createObject(FormData formData, String token) async {
    await dio.post(
      "$urlAPI/objects",
      data: formData,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../objects_service.dart';

class ObjectsServiceImp implements ObjectsService {
  final String urlAPI = dotenv.env["API_URL"]!;
  //final Client http;
  final Dio dio;

  ObjectsServiceImp(this.dio);

  @override
  Future<String> getObjects() async {
    final response = await dio.get('$urlAPI/objects');

    return response.data;
  }
}

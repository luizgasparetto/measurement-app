import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

import '../objects_service.dart';

class ObjectsServiceImp implements ObjectsService {
  final String urlAPI = dotenv.env["API_URL"]!;
  final Client http;
  //final Dio dio;

  ObjectsServiceImp(this.http);

  @override
  Future<String> getObjects() async {
    final response = await http.get(Uri.parse('$urlAPI/objects'));

    return response.body;
  }
}

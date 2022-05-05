import 'package:http/http.dart';

import '../objects_service.dart';

class ObjectsServiceImp implements ObjectsService {
  final String urlAPI = "http://18.231.54.15";
  final Client http;

  ObjectsServiceImp(this.http);

  @override
  Future<String> getObjects() async {
    final response = await http.get(Uri.parse('$urlAPI/objects'));

    return response.body;
  }
}

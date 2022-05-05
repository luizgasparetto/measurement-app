import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:measurement/app/modules/external/objects_service/auth_service.dart';

class AuthServiceImp implements AuthService {
  final String urlAPI = dotenv.env["API_URL"]!;
  //final Client http;
  final Dio dio;

  AuthServiceImp(this.dio);

  @override
  Future<void> createUser(String name, String email, String password) async {
    await dio.post(
      '$urlAPI/user',
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
    );
  }
}

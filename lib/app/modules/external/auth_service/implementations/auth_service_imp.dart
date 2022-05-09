import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:measurement/app/modules/external/auth_service/auth_service.dart';

class IResponseAuth {
  final String token;

  IResponseAuth(this.token);
}

class AuthServiceImp implements AuthService {
  final String urlAPI = dotenv.env["API_URL"]!;
  final Dio dio;

  AuthServiceImp(this.dio);

  @override
  Future<void> createUser(String name, String email, String password) async {
    await dio.post("$urlAPI/user", data: {
      'name': name,
      'email': email,
      'password': password,
    });
  }

  @override
  Future<IResponseAuth> authenticateUser(String email, String password) async {
    final response = await dio.post('$urlAPI/sessions', data: {
      'email': email,
      'password': password,
    });

    return IResponseAuth(response.data['token']);
  }

  @override
  Future<Map<String, dynamic>> getUser(String token) async {
    final response = await dio.get(
      '$urlAPI/user',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    return response.data;
  }
}

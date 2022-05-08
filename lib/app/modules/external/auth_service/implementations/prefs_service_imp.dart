import 'dart:convert';

import 'package:measurement/app/modules/domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsServiceImp {
  static const String _key = 'sharedprefkey';
  static const String _userKey = 'sharedprefuserkey';

  static Future<void> saveUserToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, jsonEncode({"token": token, "isAuth": true}));
  }

  static Future<bool> isAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonResult = prefs.getString(_key);

    if (jsonResult != null) {
      final mapUser = jsonDecode(jsonResult);
      return mapUser['isAuth'];
    }

    return false;
  }

  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonResult = prefs.getString(_key);

    final mapUser = jsonDecode(jsonResult!);
    return mapUser["token"];
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, jsonEncode({"token": null, "isAuth": false}));
  }

  static Future<void> saveUser(UserEntity user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_userKey, jsonEncode({"user": user}));
  }

  static Future<void> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonResult = prefs.getString(_userKey);

    final mapUser = jsonDecode(jsonResult!);
    return mapUser["user"];
  }
}

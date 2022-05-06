import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefsServiceImp {
  static const String _key = 'sharedprefkey';

  static Future<void> saveUser(String token) async {
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
}

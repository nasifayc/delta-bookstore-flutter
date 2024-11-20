import 'package:shared_preferences/shared_preferences.dart';

class LoginManager {
  static const String _token = 'usertoken';

  static Future<void> saveUserToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_token, token);
  }

  static Future<String?> getUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token);
  }

  static Future<void> removeToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_token);
  }
}

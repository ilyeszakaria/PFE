import 'package:shared_preferences/shared_preferences.dart';

Future<void> updateSharedPreferences(String token, int userId) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  _prefs.setString('token', token);
  _prefs.setInt('id', userId);
  Globals.setValues(token, userId);
}

Future<void> clearPrefs() async {
  var prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

Future<bool> showLoginPage() async {
  var prefs = await SharedPreferences.getInstance();

  try {
    String? token = prefs.getString('token');
    Globals.token = token;
    Globals.userId = prefs.getInt('id');
    return token != null;
  } catch (e) {
    return false;
  }
}

class Globals {
  static String? token;
  static int? userId;
  static String role = 'student';
  static setValues(String token, int userId) {
    Globals.token = token;
    Globals.userId = userId;
  }
}

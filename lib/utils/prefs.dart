import 'package:shared_preferences/shared_preferences.dart';

void updateSharedPreferences(String token, {id}) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  _prefs.setString('token', token);
  // _prefs.setInt('id', id);
}

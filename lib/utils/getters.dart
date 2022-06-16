import '../models/users.dart';
import 'client.dart';
import 'prefs.dart';

Future<List<User>> getStudents() async {
  List data = await client.get('/users/${Globals.userId}/students');
  return [for (Map e in data) User.fromJson(e)];
}

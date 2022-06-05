import 'package:flutter/material.dart';

import '../widgets/drawers.dart';
import 'student_page.dart';

class TeacherPage extends StudentPage {
  TeacherPage({Key? key, user}) : super(user: user, key: key);

  @override
  Widget get drawer => TeacherDrawer(user: user);
  @override
  String get role => 'معلم';
}

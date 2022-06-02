import 'package:flutter/material.dart';

import 'student_page.dart';

class TeacherPage extends StudentPage {
  TeacherPage({Key? key, user}) : super(user: user, key: key);

  @override
  String get role => 'معلم';
}

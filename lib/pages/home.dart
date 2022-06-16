import '../widgets/input.dart';

import '../utils/client.dart';

import '../models/users.dart';
import '../utils/prefs.dart';
import 'student_page.dart';
import 'teacher_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<User> getUser() async {
    return User.fromJson(await client.get('/users/${Globals.userId}'));
  }

  Widget _getButton(String text, String role, page) {
    return ButtonWidget(
      onPressed: () {
        Globals.role = role;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return page;
            },
          ),
        );
      },
      text: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    const String pageTitle = 'الصفحة الرئيسية';
    return FutureBuilder(
      future: getUser(),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        User user = snapshot.data;
        if (user.isStudent && !user.isTeacher) {
          Globals.role = 'student';
          return StudentPage(user: user);
        } else if (!user.isStudent && user.isTeacher) {
          Globals.role = 'teacher';
          return TeacherPage(user: user);
        }

        return Scaffold(
          appBar: AppBar(
            title: Container(
              alignment: Alignment.center,
              child: const Text(
                pageTitle,
              ),
            ),
            backgroundColor: Colors.brown,
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (String text in ['مرحبا', user.name])
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.brown,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
                Container(
                  height: 250,
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    height: 300,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: const [BoxShadow(blurRadius: 5)],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 140,
                      width: 140,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "img/imageedit.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _getButton(
                      'طالب',
                      'student',
                      StudentPage(user: user),
                    ),
                    const SizedBox(width: 30),
                    _getButton(
                      'معلم',
                      'teacher',
                      TeacherPage(user: user),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

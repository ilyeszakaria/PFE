import 'package:application3/utils/client.dart';

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
    return Container(
        margin: const EdgeInsets.only(top: 50),
        height: 100,
        width: 200,
        alignment: Alignment.bottomCenter,
        child: RaisedButton(
          onPressed: () {
            Globals.role = role;
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return page;
            }));
          },
          color: const Color.fromARGB(255, 144, 108, 94),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              text,
              style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
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
                  style: TextStyle(fontFamily: 'Cairo'),
                ),
              ),
              backgroundColor: Colors.brown,
            ),
            body: Column(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  child: Text(
                    'مرحبا ${user.name}',
                    style: const TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 30,
                      color: Color.fromARGB(255, 101, 74, 64),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  alignment: Alignment.center,
                ),
                Container(
                  width: double.infinity,
                  height: 250,
                  alignment: Alignment.center,
                  child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 300,
                      child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [BoxShadow(blurRadius: 5)],
                              borderRadius: BorderRadius.circular(20)),
                          height: 190,
                          width: 190,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "img/imageedit.jpg",
                              fit: BoxFit.fill,
                            ),
                          ))),
                ),
                Column(
                  children: [
                    _getButton(
                      'تلميذ',
                      'student',
                      StudentPage(user: user),
                    ),
                    _getButton(
                      'معلم',
                      'teacher',
                      TeacherPage(user: user),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}

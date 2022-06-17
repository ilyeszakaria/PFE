import '../mixins/chat.dart';
import '../models/users.dart';

import '../widgets/scaffold.dart';

import 'package:flutter/material.dart';

class StudentProfile extends StatelessWidget with TilawaHeadersMixin {
  final User student;
  StudentProfile({required this.student, Key? key}) : super(key: key);

  @override
  String get endpoint => '/tilawat/${student.id}?role=student';
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: 'الملف الشخصي',
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ListTile(
              title: Text(
                student.name,
                textAlign: TextAlign.right,
              ),
              trailing: const CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.black,
                ),
                backgroundColor: Colors.grey,
                radius: 50,
              ),
            ),
            const SizedBox(height: 30),
            tilawatListBuilder(),
          ],
        ),
      ),
    );
  }
}

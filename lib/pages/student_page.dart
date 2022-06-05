import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../mixins/chat.dart';
import '../models/users.dart';
import '../widgets/drawers.dart';
import '../widgets/scaffold.dart';

class StudentPage extends StatelessWidget
    with ChatHeadersMixin, TilawaHeadersMixin {
  final User user;
  StudentPage({Key? key, required this.user}) : super(key: key);

  Widget get drawer => StudentDrawer(user: user);
  final pageTitle = 'الصفحة الرئيسية';
  final role = 'طالب';

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: pageTitle,
      endDrawer: drawer,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  user.name,
                  textAlign: TextAlign.right,
                ),
                subtitle: Text(
                  role,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 10),
                ),
                trailing: const CircleAvatar(
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  radius: 30,
                  backgroundColor: Colors.grey,
                ),
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'التلاوات',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 260,
                width: double.infinity,
                child: tilawatListBuilder(),
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'المحادثات',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 260,
                width: double.infinity,
                child: chatListBuilder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

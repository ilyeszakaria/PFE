import 'package:application3/mixins/chat.dart';
import 'package:application3/models/users.dart';
import 'package:application3/widgets/drawers.dart';
import 'package:application3/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StudentPage extends StatefulWidget {
  final User user;
  const StudentPage({Key? key, required this.user}) : super(key: key);

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage>
    with ChatHeadersMixin, TilawaHeadersMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const pageTitle = 'الصفحة الرئيسية';
    const role = 'طالب';
    return ScaffoldWidget(
      pageTitle: pageTitle,
      endDrawer: StudentDrawer(user: widget.user),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  widget.user.name,
                  textAlign: TextAlign.right,
                  style: const TextStyle(),
                ),
                subtitle: const Text(
                  role,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 10,
                  ),
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
                child: Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Text(
                    'التصحيحات',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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
                child: Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Text(
                    'المحادثات',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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

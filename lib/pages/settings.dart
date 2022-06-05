import 'package:flutter/material.dart';

import '../widgets/input.dart';
import '../widgets/scaffold.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Map controllers = {
    'firstName': TextEditingController(),
    'lastName': TextEditingController(),
    'email': TextEditingController(),
    'phone': TextEditingController(),
    'password': TextEditingController(),
    'password_confirmation': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    const pageTitle = 'إعدادت الحساب';
    return ScaffoldWidget(
      pageTitle: pageTitle,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "معلومات الحساب",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            InputWidget(
              title: 'الاسم',
              controller: controllers['firstName'],
            ),
            InputWidget(
              title: 'اللقب',
              controller: controllers['lastName'],
            ),
            InputWidget(
              title: 'البريد الإلكتروني',
              controller: controllers['email'],
            ),
            InputWidget(
              title: 'رقم الهاتف',
              controller: controllers['phone'],
            ),
            const Divider(
              color: Colors.transparent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  onPressed: () {
                    print("object");
                  },
                  text: "حفظ",
                ),
                const SizedBox(width: 30),
                ButtonWidget(
                  onPressed: () {
                    print("object");
                  },
                  text: "إلغاء",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

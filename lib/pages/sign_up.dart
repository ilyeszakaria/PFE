import '../widgets/input.dart';
import '../widgets/scaffold.dart';

import 'login.dart';
import 'sign_up2.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String sex = 'male';
  bool isTeacher = false;
  bool isStudent = false;

  Map controllers = {
    'firstName': TextEditingController(),
    'lastName': TextEditingController(),
    'email': TextEditingController(),
    'password': TextEditingController(),
    'password2': TextEditingController(),
    'phone': TextEditingController(),
  };

  @override
  void dispose() {
    controllers.forEach((key, value) {
      value.dispose();
    });
    super.dispose();
  }

  String pageTitle = 'إنشاء حساب';
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: pageTitle,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
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
              icon: Icons.email,
            ),
            InputWidget(
              title: 'كلمة المرور',
              controller: controllers['password'],
              icon: Icons.key,
              obscureText: true,
            ),
            InputWidget(
              title: 'تأكيد كلمة المرور',
              controller: controllers['password2'],
              icon: Icons.key,
              obscureText: true,
            ),
            InputWidget(
              title: 'رقم الهاتف',
              controller: controllers['phone'],
              icon: Icons.phone,
            ),
            const Divider(
              color: Colors.transparent,
            ),
            const Text(
              "الجنس",
              textAlign: TextAlign.right,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                {'text': "أنثى", 'value': 'female'},
                {'text': "ذكر", 'value': 'male'},
              ]
                  .map(
                    (Map<String, String> e) => Row(
                      children: [
                        Text(e['text']!),
                        Radio<String>(
                          value: e['value']!,
                          onChanged: (String? v) {
                            setState(() {
                              sex = v!;
                            });
                          },
                          fillColor: MaterialStateProperty.all(Colors.brown),
                          autofocus: e['value'] == 'male',
                          groupValue: sex,
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
            const Text("نوع المستخدم"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Text("معلم"),
                    Checkbox(
                      value: isTeacher,
                      onChanged: (v) {
                        setState(() {
                          isTeacher = v!;
                        });
                      },
                      fillColor: MaterialStateProperty.all(Colors.brown),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(" طالب"),
                    Checkbox(
                      value: isStudent,
                      onChanged: (v) {
                        setState(() {
                          isStudent = v!;
                        });
                      },
                      fillColor: MaterialStateProperty.all(Colors.brown),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  onPressed: () async {
                    bool notEmpty = true;
                    controllers.forEach(
                      (key, value) {
                        notEmpty = notEmpty && value.text.isNotEmpty;
                      },
                    );
                    if (!notEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: double.infinity,
                            child: const Text(
                              'الرجاء ملء كل الحقول',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      );
                    } else if (!isTeacher && !isStudent) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: double.infinity,
                            child: const Text(
                              'الرجاء ادخال نوع المستخدم',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      );
                    } else {
                      Map<String, dynamic> data = {};
                      controllers.forEach((key, value) {
                        data[key] = value.text;
                      });
                      data.remove('password2');
                      data['isTeacher'] = isTeacher;
                      data['isStudent'] = isStudent;
                      data['sex'] = sex;

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUp2(data: data);
                          },
                        ),
                      );
                    }
                  },
                  text: "مواصلة",
                ),
                const SizedBox(width: 20),
                ButtonWidget(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
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

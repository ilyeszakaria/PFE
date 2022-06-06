import 'dart:convert';

import 'package:application3/models/users.dart';
import 'package:application3/widgets/input.dart';
import 'package:application3/widgets/scaffold.dart';

import 'login.dart';
import 'sign_up2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  DateTime time = DateTime.now();
  String firstName = 'a';
  String lastName = 'a';
  String username = 'a';
  String email = 'a';
  String password = 'a';
  String password2 = 'a';
  String phone = 'a';

  Map controllers = {
    'firstName': TextEditingController(),
    'lastName': TextEditingController(),
    'username': TextEditingController(),
    'email': TextEditingController(),
    'password': TextEditingController(),
    'password2': TextEditingController(),
    'phone': TextEditingController(),
  };

  @override
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
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Column(
            children: [
              InputWidget(
                title: 'الاسم',
                controller: controllers['firstName'],
              ),
              InputWidget(
                title: 'اللقب',
                controller: controllers['lastName'],
              ),
              // InputWidget(title: title, controller: controllers)
              InputWidget(
                title: 'اسم المستخدم',
                controller: controllers['username'],
                icon: Icons.person,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidget(
                    onPressed: () async {
                      if (email == "" ||
                          lastName == "" ||
                          firstName == "" ||
                          username == "" ||
                          password == "" ||
                          password2 == "" ||
                          phone == "") {
                        final text = 'الرجاء ملء كل الحقول';
                        final snackbar = SnackBar(
                            content: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: double.infinity,
                          child: Text(
                            text,
                            style: TextStyle(fontSize: 12),
                          ),
                        ));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      } else {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return SignIn2(
                            email: email,
                            lastName: lastName,
                            firstName: firstName,
                            username: username,
                            password: password,
                            phone: phone,
                          );
                        }));
                      }
                    },
                    text: "مواصلة",
                  ),
                  const SizedBox(width: 20),
                  ButtonWidget(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Login();
                      }));
                    },
                    text: "إلغاء",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

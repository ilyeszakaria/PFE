import 'package:flutter/material.dart';

import 'sign_up.dart';
import 'home.dart';
import '../widgets/input.dart';
import '../utils/client.dart';
import '../utils/prefs.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordContoller = TextEditingController();

  Future<bool> _login() async {
    var data = await client.post('/login', body: {
      'email': emailController.text,
      'password': passwordContoller.text,
    });
    try {
      await updateSharedPreferences(data['token'], data['userId']);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: const Text(
              "تسجيل الدخول",
            ),
          ),
          elevation: 10,
          backgroundColor: const Color.fromARGB(255, 107, 75, 64)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 200,
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
                      ))),
              InputWidget(
                title: 'البريد الإلكتروني',
                icon: Icons.person,
                controller: emailController,
              ),
              InputWidget(
                title: 'كلمة المرور',
                icon: Icons.key,
                controller: passwordContoller,
                obscureText: true,
              ),
              Column(
                children: [
                  GestureDetector(
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "هل نسيت كلمة المرور",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    onTap: () {},
                  )
                ],
              ),
              const Divider(color: Colors.transparent, height: 40),
              ButtonWidget(
                text: "تسجيل الدخول",
                expended: true,
                onPressed: () async {
                  snackbar(text) => SnackBar(
                        content: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: double.infinity,
                          child: Text(
                            text,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      );
                  if (emailController.text.isEmpty ||
                      passwordContoller.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      snackbar(
                        'الرجاء ادخال اسم المستخدم وكلملة المرور معا',
                      ),
                    );
                  } else {
                    var valid = await _login();
                    if (valid) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        snackbar(
                          'الرجاء التأكد من اسم المستخدم وكلملة المرور',
                        ),
                      );
                    }
                  }
                },
              ),
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                    "إنشاء حساب",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignUp();
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

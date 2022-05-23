import 'sign_up.dart';
import 'package:application3/home.dart';
import 'package:application3/utils/client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/prefs.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isActivateStudebt = true;
  bool isActivateTeacher = true;
  String username = "";
  String password = "";

  Future<bool> _login() async {
    var data = await client.post('/login', body: {
      'email': username,
      'password': password,
    });
    try {
      print(data);
      updateSharedPreferences(data['token']);
      print("false");
      return true;
    } catch (e) {
      print(e);
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
            child: Text(
              "تسجيل الدخول",
              style: TextStyle(fontFamily: 'Cairo'),
            ),
          ),
          elevation: 10,
          backgroundColor: Color.fromARGB(255, 107, 75, 64)),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[
            Container(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 1, vertical: 3),
                    child: Column(
                      children: [
                        Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 300,
                            child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [BoxShadow(blurRadius: 5)],
                                    borderRadius: BorderRadius.circular(20)),
                                height: 160,
                                width: 160,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "img/imageedit.jpg",
                                    fit: BoxFit.fill,
                                  ),
                                ))),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 30),
                              alignment: Alignment.centerRight,
                              child: Text(
                                "اسم المستخدم",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo'),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(right: 20, left: 20),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromARGB(255, 101, 74, 64),
                                        width: 5)),
                                height: 60,
                                width: double.infinity,
                                child: Form(
                                  child: TextFormField(
                                    validator: (text) {
                                      if (text == "ilyes") {
                                        return "ilyes";
                                      } else {
                                        return null;
                                      }
                                    },
                                    textAlign: TextAlign.end,
                                    onChanged: (text) {
                                      username = text;
                                    },
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    cursorColor:
                                        Color.fromARGB(255, 101, 74, 64),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        suffixIcon: Icon(
                                          Icons.person,
                                          color: Colors.brown,
                                        )),
                                  ),
                                )),
                            Divider(
                              color: Colors.white,
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 30),
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "كلمة السر",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Cairo'),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 20, left: 20),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 101, 74, 64),
                                          width: 5)),
                                  height: 60,
                                  width: double.infinity,
                                  child: TextFormField(
                                    onChanged: ((value) {
                                      password = value;
                                    }),
                                    textAlign: TextAlign.end,
                                    obscureText: true,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                    cursorColor:
                                        Color.fromARGB(255, 101, 74, 64),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        suffixIcon: Icon(
                                          Icons.key,
                                          color: Colors.brown,
                                        )),
                                  ),
                                ),
                                GestureDetector(
                                  child: Container(
                                    child: Text(
                                      "هل نسيت كلمة السر ",
                                      style: TextStyle(fontFamily: 'Cairo'),
                                    ),
                                    margin: EdgeInsets.only(right: 230),
                                  ),
                                  onTap: () {
                                    print("object");
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.white,
                          height: 40,
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 5),
                            child: FlatButton(
                              onPressed: () async {
                                if (username == "" || password == "") {
                                  const text =
                                      'الرجاء ادخال اسم المستخدم وكلملة المرور معا';
                                  final snackbar = SnackBar(
                                    content: Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: double.infinity,
                                      child: Text(
                                        text,
                                        style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar);
                                } else {
                                  if (await _login()) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Home(username: username),
                                      ),
                                    );
                                  } else {
                                    print("false");
                                  }
                                }
                              },
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 130),
                              child: Text(
                                "تسجيل الدخول",
                                style: TextStyle(
                                    fontSize: 15, fontFamily: 'Cairo'),
                              ),
                              color: Color.fromARGB(255, 101, 74, 64),
                            )),
                        GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              "انشاء حساب",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo'),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return SignIn();
                            }));
                            print(username);
                            print(password);
                          },
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}

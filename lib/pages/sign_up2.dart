import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../pages/login.dart';
import '../pages/sign_up.dart';
import '../utils/client.dart';
import '../widgets/input.dart';
import '../widgets/scaffold.dart';

class SignIn2 extends StatefulWidget {
  final String email;
  final String lastName;
  final String firstName;
  final String username;
  final String password;
  final String phone;
  const SignIn2({
    Key? key,
    required this.email,
    required this.lastName,
    required this.firstName,
    required this.phone,
    required this.password,
    required this.username,
  }) : super(key: key);

  @override
  State<SignIn2> createState() => _SignIn2State();
}

class _SignIn2State extends State<SignIn2> {
  var _sex;

  Future createUser() async {
    var body = {
      "firstName": widget.firstName,
      "lastName": widget.lastName,
      "email": widget.email,
      "isStudent": isTeacher,
      "isTeacher": isStudent,
      "riwayaId": 1,
      "password": widget.password,
      "username": widget.username,
      "sex": sex
    };
    return await client.post('/users/', body: body);
  }

  String debut = "";
  String fin = "";
  String dropdownValue1 = 'الفاتحة';
  String dropdownValue2 = 'الفاتحة';
  var flag = true;
  var sex;
  bool isTeacher = false;
  bool isStudent = false;
  String gender = "ذكر";
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
              Container(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text("الصنف"),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: <Widget>[
                          Text("ذكر"),
                          Radio(
                            value: 1,
                            onChanged: (v) {
                              setState(() {
                                this._sex = v;
                                this.sex = "male";
                              });
                            },
                            groupValue: this._sex, // قيمة زر الراديو
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          Text("أنثى"),
                          Radio(
                            value: 2,
                            onChanged: (v) {
                              setState(() {
                                this._sex = v;
                                this.sex = "female";
                              });
                            },
                            groupValue: this._sex,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text("نوع المستخدم"),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text("معلم"),
                              Checkbox(
                                value: isTeacher,
                                onChanged: (val) {
                                  setState(() {
                                    isTeacher = val!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(" طالب"),
                            Checkbox(
                              value: isStudent,
                              onChanged: (val) {
                                setState(() {
                                  isStudent = val!;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 40,
                    alignment: Alignment.centerRight,
                    child: Text("كم تحفظ من القران الكريم "),
                  ),
                  Container(
                    width: double.infinity,
                    height: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 40,
                          child: TextFormField(
                            textAlign: TextAlign.end,
                            onChanged: (text) {
                              debut = text;
                            },
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            cursorColor: Colors.brown,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.brown),
                          ),
                        ),
                        Text("الاية رقم"),
                        VerticalDivider(
                          color: Colors.transparent,
                        ),
                        Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 90,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.brown),
                            ),
                            child: DropdownButton<String>(
                              value: dropdownValue1,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              underline: Container(
                                height: 2,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue1 = newValue!;
                                });
                              },
                              items: <String>[
                                'مريم',
                                'النساء',
                                'ال عمران',
                                'البقرة',
                                'الفاتحة'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(),
                                  ),
                                );
                              }).toList(),
                            )),
                        VerticalDivider(
                          color: Colors.white,
                        ),
                        Text("من سورة"),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 40,
                          child: TextFormField(
                            textAlign: TextAlign.end,
                            onChanged: (text) {
                              fin = text;
                            },
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.brown,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.brown),
                          ),
                        ),
                        Text("الاية رقم"),
                        VerticalDivider(
                          color: Colors.transparent,
                        ),
                        Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 90,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.brown,
                              ),
                            ),
                            child: DropdownButton<String>(
                              value: dropdownValue2,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              underline: Container(
                                height: 2,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue2 = newValue!;
                                });
                              },
                              items: <String>[
                                'مريم',
                                'النساء',
                                'ال عمران',
                                'البقرة',
                                'الفاتحة'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            )),
                        VerticalDivider(
                          color: Colors.white,
                        ),
                        Text("الى سورة")
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidget(
                    onPressed: () async {
                      if (sex == null) {
                        final text = 'الرجاء اختيار الصنف';
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
                        if (isTeacher == false && isStudent == false) {
                          final text = 'الرجاء ادخال نوع المستخدم';
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
                          await createUser();

                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Login()));
                        }
                      }
                    },
                    text: "مواصلة",
                  ),
                  const SizedBox(width: 20),
                  ButtonWidget(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignIn();
                          },
                        ),
                      );
                    },
                    text: "عودة",
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

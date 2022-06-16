import 'package:flutter/material.dart';

import '../pages/login.dart';
import '../pages/sign_up.dart';
import '../utils/client.dart';
import '../widgets/input.dart';
import '../widgets/scaffold.dart';
import '../models/users.dart';

class SignUp2 extends StatefulWidget {
  final Map<String, dynamic> data;
  const SignUp2({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  Future createUser() async {
    var body = widget.data;
    return await client.post('/users/', body: body);
  }

  Future<List<User>> getTeachers() async {
    List data = await client.get('/users/teachers');
    return [for (Map e in data) User.fromJson(e)];
  }

  int teacherId = 0;
  String pageTitle = 'اختيار المعلم';
  @override
  Widget build(BuildContext context) {
    if (!widget.data['isStudent']) {
      return FutureBuilder(
        future: createUser(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Login()
              : const Center(child: CircularProgressIndicator());
        },
      );
    }
    return ScaffoldWidget(
      pageTitle: pageTitle,
      body: Stack(
        children: [
          FutureBuilder(
            future: getTeachers(),
            builder: (context, AsyncSnapshot<List<User>> snapshot) {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  User user = snapshot.data![index];
                  return RadioListTile(
                    value: user.id,
                    groupValue: teacherId,
                    title: Text(
                      user.name,
                      textAlign: TextAlign.right,
                    ),
                    activeColor: Colors.brown,
                    onChanged: (int? v) => setState(() {
                      teacherId = v!;
                    }),
                  );
                },
              );
            },
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  onPressed: () async {
                    widget.data['teacherId'] = teacherId;
                    try {
                      await createUser();
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: double.infinity,
                            child: const Text(
                              'هذا البريد مستعمل.',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
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
                      MaterialPageRoute(
                        builder: (context) {
                          return const SignUp();
                        },
                      ),
                    );
                  },
                  text: "عودة",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

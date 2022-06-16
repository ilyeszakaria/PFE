import '../models/tests.dart';

import 'message_test_teacher.dart';
import '../models/message_tilawa_model1.dart';
import '../widgets/scaffold.dart';
import 'package:flutter/material.dart';

class ReponseTest extends StatelessWidget {
  final TestModel test;

  const ReponseTest({
    Key? key,
    required this.test,
  }) : super(key: key);

  Future<List<Reponce>> getTestResponses() async {
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: 'اختبار',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "السؤال",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              test.question,
              textAlign: TextAlign.right,
            ),
            const Text(
              "الإجابات",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 260,
              width: double.infinity,
              child: FutureBuilder<List<Reponce>>(
                future: getTestResponses(),
                builder: (context, snapshot) {
                  final reponces = snapshot.data;
                  return ListView.builder(
                    itemCount: reponces?.length ?? 0,
                    itemBuilder: (context, index) {
                      final reponce = reponces![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const MessageTestTeacher(
                                  idtest: "",
                                  idstudent: "",
                                );
                              },
                            ),
                          );
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 15),
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.centerRight,
                                          width: 230,
                                          child: Text(reponce.username),
                                        ),
                                        const Divider(
                                          height: 8,
                                        ),
                                        Container(
                                          alignment: Alignment.centerRight,
                                          width: 130,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const CircleAvatar(
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 240, 238, 238),
                                    radius: 25,
                                  ),
                                ],
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.end,
                          ),
                          height: 60,
                          color: Colors.grey,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

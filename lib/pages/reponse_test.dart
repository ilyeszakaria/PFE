import 'dart:convert';
import 'message_test_teacher.dart';
import '../models/message_tilawa_model1.dart';
import '../widgets/scaffold.dart';
import 'package:flutter/material.dart';

class ReponseTest extends StatelessWidget {
  final String testId;
  final String datetest;

  const ReponseTest({
    Key? key,
    required this.testId,
    required this.datetest,
  }) : super(key: key);

  Future<List<Reponce>> getReponce(BuildContext context) async {
    final assetBundel = DefaultAssetBundle.of(context);
    final data = await assetBundel.loadString('assets/Reponce.json');
    final body = json.decode(data);
    return body.map<Reponce>(Reponce.formJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: 'اختبار',
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      child: const Text(
                        "الاختبار",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.calendar_month, color: Colors.brown),
                  Text(datetest),
                  const Text("اخر اجل يوم")
                ],
              ),
              height: 65,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(
                        Icons.watch_later,
                        color: Colors.brown,
                      ),
                      VerticalDivider(
                        color: Colors.white,
                      ),
                      Text(
                        "15:30",
                      ),
                      VerticalDivider(
                        color: Colors.white,
                      ),
                      Text("على الساعة"),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  alignment: Alignment.centerRight,
                  child: const Text(
                    "الاجابات",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 260,
              width: double.infinity,
              child: FutureBuilder<List<Reponce>>(
                future: getReponce(context),
                builder: (context, snapchot) {
                  final reponces = snapchot.data;
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

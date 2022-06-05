import 'dart:convert';
import 'package:flutter/material.dart';

import 'test_chat.dart';
import '../models/messageTilawaModel1.dart';
import '../widgets/scaffold.dart';

class ListeTestStudent extends StatelessWidget {
  ListeTestStudent({Key? key}) : super(key: key);
  static Future<List<TestStudent>> getTestStudent(BuildContext context) async {
    final assetBundel = DefaultAssetBundle.of(context);
    final data = await assetBundel.loadString('assets/TestStudent.json');
    final body = json.decode(data);
    return body.map<TestStudent>(TestStudent.fromJson).toList();
  }

  String pageTitle = 'الاختبارات';
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: pageTitle,
      body: FutureBuilder<List<TestStudent>>(
        future: getTestStudent(context),
        builder: (context, snapshot) {
          final tests = snapshot.data;
          return ListView.builder(
            itemCount: tests?.length ?? 0,
            itemBuilder: (context, index) {
              final test = tests![index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return TestChat();
                      },
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 100,
                            child: Text(
                              test.date,
                              style: TextStyle(fontSize: 10),
                            ),
                            alignment: Alignment.center,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 100,
                            child: Text("7.5"),
                          ),
                        ],
                      ),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(test.AyaDebut),
                                      Text("الاية رقم"),
                                      Text(test.SouraDebut),
                                      Text("من سورة")
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(test.AyaFin),
                                      Text("اللاية رقم"),
                                      Text(test.SouraFin),
                                      Text("الى سورة")
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.grey,
                          ),
                        ],
                      )),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    boxShadow: [BoxShadow(blurRadius: 1)],
                    color: Colors.grey,
                  ),
                  width: double.infinity,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

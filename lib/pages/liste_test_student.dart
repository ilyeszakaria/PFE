import 'dart:convert';
import 'package:flutter/material.dart';

import 'test_chat.dart';
import '../models/message_tilawa_model1.dart';
import '../widgets/scaffold.dart';

class StudentTestsList extends StatelessWidget {
  const StudentTestsList({Key? key}) : super(key: key);
  Future<List<TestStudent>> getTestStudent(BuildContext context) async {
    final assetBundel = DefaultAssetBundle.of(context);
    final data = await assetBundel.loadString('assets/TestStudent.json');
    final body = json.decode(data);
    return body.map<TestStudent>(TestStudent.fromJson).toList();
  }

  final String pageTitle = 'الاختبارات';
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
                        return const TestChat();
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
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.centerRight,
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(test.ayaDebut),
                                    const Text("الاية رقم"),
                                    Text(test.souraDebut),
                                    const Text("من سورة")
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(test.ayaFin),
                                    const Text("اللاية رقم"),
                                    Text(test.souraFin),
                                    const Text("الى سورة")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    boxShadow: const [BoxShadow(blurRadius: 1)],
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

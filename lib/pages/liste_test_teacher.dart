import 'dart:convert';
import '../widgets/scaffold.dart';

import 'reponse_test.dart';
import 'test.dart';
import '../models/message_tilawa_model1.dart';

import 'package:flutter/material.dart';

class TeacherTestsList extends StatefulWidget {
  const TeacherTestsList({Key? key}) : super(key: key);

  @override
  State<TeacherTestsList> createState() => _TeacherTestsListState();
}

class _TeacherTestsListState extends State<TeacherTestsList> {
  Future<List<TestTeacher>> getTestTeacher(BuildContext context) async {
    final assetBundel = DefaultAssetBundle.of(context);
    final data = await assetBundel.loadString('assets/TestTeacher.json');
    final body = json.decode(data);
    return body.map<TestTeacher>(TestTeacher.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: 'الاختبارات',
      body: FutureBuilder<List<TestTeacher>>(
        future: getTestTeacher(context),
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
                        return ReponseTest(
                          testId: test.id,
                          datetest: test.date,
                        );
                      },
                    ),
                  );
                },
                child: Text(test.id),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const Test();
              },
            ),
          );
        },
        label: const Text(
          "بدء اختبار",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: const Icon(
          Icons.add,
          size: 30,
        ),
        backgroundColor: Colors.brown[400],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

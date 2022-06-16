import '../models/tests.dart';
import '../utils/client.dart';

import '../utils/prefs.dart';
import '../widgets/scaffold.dart';

import 'reponse_test.dart';
import 'test.dart';

import 'package:flutter/material.dart';

class TeacherTestsList extends StatefulWidget {
  const TeacherTestsList({Key? key}) : super(key: key);

  @override
  State<TeacherTestsList> createState() => _TeacherTestsListState();
}

class _TeacherTestsListState extends State<TeacherTestsList> {
  Future<List<TestModel>> getTeacherTests() async {
    var data = await client.get('/tests/teacher/${Globals.userId}');
    return [for (Map t in data) TestModel.fromJson(t)];
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: 'الاختبارات',
      body: FutureBuilder<List<TestModel>>(
        future: getTeacherTests(),
        builder: (context, snapshot) {
          final tests = snapshot.data;
          return ListView.builder(
            itemCount: tests?.length ?? 0,
            itemBuilder: (context, index) {
              final test = tests![index];
              return ListTile(
                title: Text(
                  test.question,
                  textAlign: TextAlign.right,
                ),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReponseTest(test: test),
                  ),
                ),
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
        backgroundColor: Colors.brown,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

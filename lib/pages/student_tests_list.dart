import 'package:flutter/material.dart';

import '../models/tests.dart';
import '../utils/client.dart';
import '../utils/prefs.dart';
import '../widgets/scaffold.dart';
import 'test_chat.dart';

class StudentTestsList extends StatelessWidget {
  const StudentTestsList({Key? key}) : super(key: key);
  Future<List<TestModel>> getTests() async {
    List data = await client.get('/tests/student/${Globals.userId}/');
    return [for (Map t in data) TestModel.fromJson(t)];
  }

  final String pageTitle = 'الاختبارات';
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: pageTitle,
      body: FutureBuilder<List<TestModel>>(
        future: getTests(),
        builder: (context, snapshot) {
          final tests = snapshot.data;
          return ListView.builder(
            itemCount: tests?.length ?? 0,
            itemBuilder: (context, index) {
              final test = tests![index];
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TestChat(test: test),
                    ),
                  );
                },
                title: Text(
                  test.question,
                  textAlign: TextAlign.right,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

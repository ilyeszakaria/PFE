import 'package:application3/models/tests.dart';
import 'package:flutter/material.dart';

import 'test_chat.dart';
import '../widgets/scaffold.dart';

class StudentTestsList extends StatelessWidget {
  const StudentTestsList({Key? key}) : super(key: key);
  Future<List<TestModel>> getTests() async {
    return [];
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
                child: Text(test.question),
              );
            },
          );
        },
      ),
    );
  }
}

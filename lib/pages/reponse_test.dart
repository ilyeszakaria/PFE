import '../models/messages.dart';
import '../utils/client.dart';
import '../widgets/messages.dart';

import '../models/tests.dart';

import 'message_test_teacher.dart';
import '../widgets/scaffold.dart';
import 'package:flutter/material.dart';

class TestResponsesList extends StatelessWidget {
  final TestModel test;

  const TestResponsesList({
    Key? key,
    required this.test,
  }) : super(key: key);

  Future<List<TestResponse>> getTestResponses() async {
    List data = await client.get('/tests/${test.id}/responses/');
    return [for (Map r in data) TestResponse.fromJson(r)];
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
              child: FutureBuilder<List<TestResponse>>(
                future: getTestResponses(),
                builder: (context, snapshot) {
                  final responses = snapshot.data;
                  return ListView.separated(
                    itemCount: responses?.length ?? 0,
                    separatorBuilder: (context, index) =>
                        const Divider(height: 2),
                    itemBuilder: (context, index) {
                      final response = responses![index];
                      var msg = AudioMessageWidget(
                        Message(senderId: 0, audio: response.audio!),
                      );
                      return ListTile(
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
                        title: Text(
                          response.studentName,
                          textAlign: TextAlign.right,
                        ),
                        leading: IconButton(
                          icon: const Icon(Icons.play_arrow),
                          onPressed: () {},
                        ),
                        tileColor: Colors.grey[300],
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

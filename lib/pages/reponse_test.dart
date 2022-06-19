import '../widgets/input.dart';

import '../models/messages.dart';
import '../utils/client.dart';
import '../widgets/messages.dart';

import '../models/tests.dart';

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

  Future correctResponse(int responseId, bool valid) async {
    await client.put(
      '/tests/responses/$responseId',
      body: {'valid': valid},
    );
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
                      return ListTile(
                        onTap: () {
                          Widget childWidget;
                          Widget audioPlayer = response.audio != null
                              ? AudioMessageWidget(
                                  Message(
                                    senderId: 0,
                                    audio: response.audio!,
                                  ),
                                )
                              : Container();
                          if (response.audio != null &&
                              response.valid == null) {
                            bool correct = false;

                            childWidget = Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: audioPlayer),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ButtonWidget(
                                      text: 'إجابة صحيحة',
                                      onPressed: () async {
                                        await correctResponse(
                                            response.id, true);
                                      },
                                    ),
                                    ButtonWidget(
                                      text: 'إجابة خاطئة',
                                      onPressed: () async {
                                        await correctResponse(
                                            response.id, false);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            );
                          } else if (response.audio == null) {
                            childWidget = const Text('لم يرسل إجابة بعد');
                          } else {
                            childWidget = audioPlayer;
                          }

                          showDialog(
                            context: context,
                            builder: (context) => Center(
                              child: SizedBox(
                                height: 180,
                                child: Container(
                                  child: childWidget,
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(40),
                                ),
                              ),
                            ),
                          );
                        },
                        title: Text(
                          response.studentName,
                          textAlign: TextAlign.right,
                        ),
                        tileColor: response.valid == null
                            ? Colors.grey[300]
                            : response.valid!
                                ? Colors.green[100]
                                : Colors.red[100],
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

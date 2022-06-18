import 'dart:io';
import 'package:application3/models/messages.dart';
import 'package:flutter/material.dart';

import '../utils/client.dart';
import '../utils/prefs.dart';
import '../widgets/input.dart';
import '../widgets/messages.dart';
import '../mixins/chat.dart';
import '../widgets/scaffold.dart';
import '../models/tests.dart';

class TestChat extends StatefulWidget {
  final TestModel test;
  const TestChat({
    required this.test,
    Key? key,
  }) : super(key: key);

  @override
  State<TestChat> createState() => _TestChatState();
}

class _TestChatState extends State<TestChat> with MessagesMixin {
  bool showQuestion = false;
  String? audioPath;
  @override
  void initState() {
    super.initState();
    initRecorder();
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }

  @override
  Future<void> sendAudioMessage() async {
    File audio = File(filePath);
    await client.audioPost(
      '/tests/responses/',
      file: await audio.readAsBytes(),
      data: {
        'testId': widget.test.id,
        'studentId': Globals.userId,
      },
    );
  }

  Future<TestResponse> getTestResponse() async {
    List data = await client
        .get('/tests/${widget.test.id}/responses?studentId=${Globals.userId}');
    return TestResponse.fromJson(data[0]);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: 'اختبار',
      body: FutureBuilder(
        future: getTestResponse(),
        builder: (context, AsyncSnapshot<TestResponse> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Widget> children = [
            const Text('السؤال'),
            Text(widget.test.question),
          ];
          if (snapshot.data!.audio != null) {
            var msg = Message(
              senderId: widget.test.id,
              audio: snapshot.data!.audio!,
            );

            children.addAll(
              [
                const Text('الإجابة'),
                AudioMessageWidget(msg),
              ],
            );
            showQuestion = true;
          } else {
            children.addAll(
              [
                Timer(recorder: recorder),
                ButtonWidget(
                  text: 'إرسال',
                  onPressed: () async {
                    filePath = (await recorder.stopRecorder())!;
                    await sendAudioMessage();
                  },
                )
              ],
            );
          }
          return showQuestion
              ? SizedBox(
                  width: double.infinity,
                  child: Column(
                    textDirection: TextDirection.rtl,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: children,
                  ),
                )
              : Center(
                  child: ButtonWidget(
                    onPressed: () async {
                      await recorder.startRecorder(toFile: filePath);
                      setState(() => (showQuestion = true));
                    },
                    text: 'عرض السؤال وبدء التسجيل',
                    expended: true,
                  ),
                );
        },
      ),
    );
  }
}

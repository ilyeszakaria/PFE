import '../widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class MessageTestTeacher extends StatefulWidget {
  final String idtest;
  final String idstudent;
  final String username = '';
  const MessageTestTeacher({
    Key? key,
    required this.idstudent,
    required this.idtest,
  }) : super(key: key);

  @override
  State<MessageTestTeacher> createState() => _MessageTestTeacherState();
}

class _MessageTestTeacherState extends State<MessageTestTeacher> {
  final recorder = FlutterSoundRecorder();

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

  Future initRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw 'Microphone permission not granted';
    }

    await recorder.openRecorder();
    recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
  }

  Future record() async {
    await recorder.startRecorder(toFile: 'audio');
  }

  Future stop() async {
    await recorder.stopRecorder();
  }

  Future<List> getmessageTilawa() async {
    return [];
  }

  late String note;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: 'اختبار',
      body: Container(),
    );
  }
}

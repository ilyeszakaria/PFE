import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:application3/models/messages.dart';
import 'package:application3/utils/client.dart';
import 'package:application3/widgets/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class Revision extends StatefulWidget {
  final int tilawaId;
  final int ayaDebut;
  final int ayaFin;
  final String souraDebut;
  final String souraFin;
  final String username;
  const Revision({
    Key? key,
    required this.tilawaId,
    required this.ayaDebut,
    required this.ayaFin,
    required this.souraDebut,
    required this.souraFin,
    required this.username,
  }) : super(key: key);

  @override
  State<Revision> createState() => _RevisionState();
}

class _RevisionState extends State<Revision> {
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

  final filePath = 'audio.aac';
  Future record() async {
    await recorder.startRecorder(toFile: filePath);
  }

  static Future<List<Message>> getMessageTilawa(
    BuildContext context,
  ) async {
    final assetBundel = DefaultAssetBundle.of(context);
    final data = await assetBundel.loadString('assets/MessageTilawa.json');
    final body = json.decode(data);
    return body.map<Message>(Message.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Row(
          children: [
            const VerticalDivider(
              width: 45,
            ),
            Text(
              widget.ayaFin.toString(),
              style: const TextStyle(fontFamily: 'Cairo', fontSize: 15),
            ),
            const VerticalDivider(),
            Text(
              widget.souraFin,
              style: const TextStyle(fontFamily: 'Cairo', fontSize: 15),
            ),
            const VerticalDivider(
              width: 30,
            ),
            const Text(
              "الى",
              style: const TextStyle(fontFamily: 'Cairo', fontSize: 15),
            ),
            const VerticalDivider(
              width: 25,
            ),
            Text(
              widget.ayaDebut.toString(),
              style: const TextStyle(fontFamily: 'Cairo', fontSize: 15),
            ),
            const VerticalDivider(),
            Text(
              widget.souraDebut,
              style: const TextStyle(fontFamily: 'Cairo', fontSize: 15),
            ),
            const VerticalDivider(),
            const Text(
              "من",
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 15,
              ),
            ),
          ],
        ),
        elevation: 10,
        backgroundColor: Colors.brown[400],
      ),
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 600,
            child: FutureBuilder<List<Message>>(
              future: getMessageTilawa(context),
              builder: (context, snapchot) {
                final messages = snapchot.data;
                return ListView.builder(
                  itemCount: messages?.length ?? 0,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  itemBuilder: (context, index) {
                    var message = messages![index];
                    return message.audio == ''
                        ? TextMessageWidget(message)
                        : AudioMessageWidget(message);
                  },
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 250,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.brown),
                    onPressed: () async {
                      if (recorder.isRecording) {
                        String? audioPath = await recorder.stopRecorder();

                        File audio = File(audioPath!);
                        await client.audioPost(
                          '/chat/test',
                          file: await audio.readAsBytes(),
                        );
                      } else {
                        await record();
                      }
                      setState(() {});
                    },
                    child: Icon(
                      recorder.isRecording ? Icons.stop : Icons.mic,
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      const Expanded(
                        child: TextField(
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                              hintText: "ملاحظة",
                              hintStyle: TextStyle(color: Colors.black54),
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        child: const Icon(Icons.send),
                        backgroundColor: Colors.brown,
                        elevation: 0,
                      ),
                    ],
                  ),
                  StreamBuilder<RecordingDisposition>(
                      stream: recorder.onProgress,
                      builder: (context, snapshot) {
                        final duration = snapshot.hasData
                            ? snapshot.data!.duration
                            : Duration.zero;
                        String twoDigits(int n) => n.toString().padLeft(2, '0');
                        String minutes = twoDigits(duration.inMinutes);
                        String seconds = twoDigits(duration.inSeconds % 60);
                        return Text(
                          '$minutes:$seconds',
                          style: const TextStyle(
                            fontSize: 30,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

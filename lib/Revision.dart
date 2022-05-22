import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:application3/models/messageTilawaModel1.dart';
import 'package:application3/utils/client.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class Revision extends StatefulWidget {
  final int idtilawa;
  final int AyaDebut;
  final int AyaFin;
  final String SouraDebut;
  final String SouraFin;
  final String username;
  const Revision(
      {Key? key,
      required this.idtilawa,
      required this.AyaDebut,
      required this.AyaFin,
      required this.SouraDebut,
      required this.SouraFin,
      required this.username})
      : super(key: key);

  @override
  State<Revision> createState() => _RevisionState();
}

class _RevisionState extends State<Revision> {
  final recorder = FlutterSoundRecorder();
  bool isPlaying = false;
  late AudioPlayer player;

  Duration currentPosition = Duration();
  Duration musicLength = Duration();

  @override
  void initState() {
    super.initState();
    initRecorder();

    player = AudioPlayer();

    setUp();
  }

  setUp() {
    player.onAudioPositionChanged.listen((d) {
      setState(() {
        currentPosition = d;
      });

      player.onDurationChanged.listen((d) {
        setState(() {
          musicLength = d;
        });
      });
    });
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

  playMusic(String path) {
    print(path);
    player.play(path);
  }

  stopMusic() {
    player.pause();
  }

  String? _path;
  final filePath = 'audio.aac';
  Future record() async {
    await recorder.startRecorder(toFile: filePath);
  }

  static Future<List<MessageTilawa>> getmessageTilawa(
      BuildContext context) async {
    final assetBundel = DefaultAssetBundle.of(context);
    final data = await assetBundel.loadString('assets/MessageTilawa.json');
    final body = json.decode(data);
    return body.map<MessageTilawa>(MessageTilawa.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Row(
            children: [
              VerticalDivider(
                width: 45,
              ),
              Text(
                widget.AyaFin.toString(),
                style: TextStyle(fontFamily: 'Cairo', fontSize: 15),
              ),
              VerticalDivider(),
              Text(
                widget.SouraFin,
                style: TextStyle(fontFamily: 'Cairo', fontSize: 15),
              ),
              VerticalDivider(
                width: 30,
              ),
              Text(
                "الى",
                style: TextStyle(fontFamily: 'Cairo', fontSize: 15),
              ),
              VerticalDivider(
                width: 25,
              ),
              Text(
                widget.AyaDebut.toString(),
                style: TextStyle(fontFamily: 'Cairo', fontSize: 15),
              ),
              VerticalDivider(),
              Text(
                widget.SouraDebut,
                style: TextStyle(fontFamily: 'Cairo', fontSize: 15),
              ),
              VerticalDivider(),
              Text(
                "من",
                style: TextStyle(fontFamily: 'Cairo', fontSize: 15),
              ),
            ],
          ),
          elevation: 10,
          backgroundColor: Colors.brown[400]),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 600,
            child: FutureBuilder<List<MessageTilawa>>(
              future: getmessageTilawa(context),
              builder: (context, snapchot) {
                final messagesTilawa = snapchot.data;
                return ListView.builder(
                  itemCount: messagesTilawa?.length ?? 0,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  itemBuilder: (context, index) {
                    final messageTilawa = messagesTilawa![index];

                    return Container(
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 10),
                      child: Align(
                        alignment: (messageTilawa.sender != widget.username
                            ? Alignment.topLeft
                            : Alignment.topRight),
                        child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: (messageTilawa.sender != widget.username
                                  ? Colors.grey.shade200
                                  : Colors.brown[200]),
                            ),
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (isPlaying) {
                                      setState(() {
                                        isPlaying = false;
                                      });
                                      stopMusic();
                                    } else {
                                      setState(() {
                                        isPlaying = true;
                                      });
                                      playMusic(
                                          // _path!,
                                          'http://192.168.1.108:8000/sound.mp3'
                                          //'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-13.mp3',
                                          );
                                    }

                                    setState(() {});
                                  },
                                  child: Icon(isPlaying == true
                                      ? Icons.stop
                                      : Icons.play_arrow),
                                ),
                                Text(
                                  messageTilawa.audio,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            )),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
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
                        _path = audioPath;

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
                    child: Icon(recorder.isRecording ? Icons.stop : Icons.mic),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                              hintText: "ملاحظة",
                              hintStyle: TextStyle(color: Colors.black54),
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.send),
                        backgroundColor: Colors.brown,
                        elevation: 0,
                      ),
                    ],
                  ),
                  Text(
                    "00:00",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

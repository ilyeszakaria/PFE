import '../models/messages.dart';
import '../utils/prefs.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';

import '../utils/client.dart';

class MessageWidget extends Container {
  MessageWidget({
    Key? key,
    required this.message,
  }) : super(key: key);
  bool get isSelfMessage => message.senderId == Globals.userId;
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 14,
        right: 14,
        top: 10,
        bottom: 10,
      ),
      child: Align(
        alignment: (isSelfMessage ? Alignment.topLeft : Alignment.topRight),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (isSelfMessage ? Colors.grey.shade200 : Colors.brown[200]),
          ),
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}

class AudioMessageWidget extends MessageWidget {
  final AudioPlayer player = AudioPlayer();

  AudioMessageWidget(message, {Key? key}) : super(message: message, key: key);

  @override
  Widget get child => Row(
        children: [
          GestureDetector(
            onTap: () {
              if (player.state == PlayerState.PLAYING) {
                player.pause();
              } else {
                player.play('http://$serverDomain/audio/${message.audio}');
              }
            },
            child: StreamBuilder<PlayerState>(
                stream: player.onPlayerStateChanged,
                builder: (context, snapshot) {
                  bool showStop = player.state == PlayerState.PLAYING;
                  return Icon(showStop ? Icons.stop : Icons.play_arrow);
                }),
          ),
          const Text(
            'رسالة صوتية', //player.getDuration().toString(),
            style: TextStyle(fontSize: 15),
          ),
        ],
      );
}

class TextMessageWidget extends MessageWidget {
  TextMessageWidget(message, {Key? key}) : super(message: message, key: key);

  @override
  Widget get child => Text(
        message.text,
        textAlign: TextAlign.right,
        style: const TextStyle(
          fontSize: 15,
        ),
      );
}

class Timer extends StatelessWidget {
  const Timer({
    Key? key,
    required this.recorder,
  }) : super(key: key);

  final FlutterSoundRecorder recorder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RecordingDisposition>(
        stream: recorder.onProgress,
        builder: (context, snapshot) {
          final duration =
              snapshot.hasData ? snapshot.data!.duration : Duration.zero;
          String twoDigits(int n) => n.toString().padLeft(2, '0');
          String minutes = twoDigits(duration.inMinutes);
          String seconds = twoDigits(duration.inSeconds % 60);
          return Text(
            '$minutes:$seconds',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          );
        });
  }
}

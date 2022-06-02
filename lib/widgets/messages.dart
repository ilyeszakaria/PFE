import 'package:application3/models/messages.dart';
import 'package:application3/utils/prefs.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';

class MessageWidget extends Container {
  bool? isSelfMessage;
  MessageWidget({
    Key? key,
    required this.message,
  }) : super(key: key) {
    isSelfMessage = message.senderId == Globals.userId;
  }
  Message message;
  Widget? _child;

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
        alignment: (isSelfMessage! ? Alignment.topLeft : Alignment.topRight),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (isSelfMessage! ? Colors.grey.shade200 : Colors.brown[200]),
          ),
          padding: const EdgeInsets.all(16),
          child: _child,
        ),
      ),
    );
  }
}

class AudioMessageWidget extends MessageWidget {
  AudioPlayer player = AudioPlayer();

  AudioMessageWidget(message, {Key? key}) : super(message: message, key: key) {
    _child = Row(
      children: [
        GestureDetector(
          onTap: () {
            if (player.state == PlayerState.PLAYING) {
              player.pause();
            } else {
              player.play(message.audio);
            }
          },
          child: StreamBuilder<PlayerState>(
              stream: player.onPlayerStateChanged,
              builder: (context, snapshot) {
                bool showStop = player.state == PlayerState.PLAYING;
                return Icon(showStop ? Icons.stop : Icons.play_arrow);
              }),
        ),
        Text(
          'audio', //player.getDuration().toString(),
          style: const TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}

class TextMessageWidget extends MessageWidget {
  TextMessageWidget(message, {Key? key}) : super(message: message, key: key) {
    _child = Text(
      message.text,
      textAlign: TextAlign.right,
      style: TextStyle(
        fontSize: 15,
      ),
    );
  }
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

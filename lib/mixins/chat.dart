import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../models/messages.dart';
import '../utils/client.dart';
import '../utils/prefs.dart';
import '../widgets/chat.dart';

mixin ChatHeadersMixin {
  Future<List<ConversationModel>> getConvesationsList() async {
    List data = await client.get(
      '/conversations/${Globals.userId}?role=${Globals.role}',
    );
    return [for (Map e in data) ConversationModel.fromJson(e)];
  }

  Widget chatListBuilder() {
    return FutureBuilder<List<ConversationModel>>(
      future: getConvesationsList(),
      builder: (context, snapchot) {
        final conversations = snapchot.data;
        return ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.white,
              height: 2,
            );
          },
          itemCount: conversations?.length ?? 0,
          itemBuilder: (context, index) =>
              ChatHeaderWidget(conversation: conversations![index]),
        );
      },
    );
  }
}

mixin TilawaHeadersMixin {
  final String endpoint = '/tilawat/${Globals.userId}?role=${Globals.role}';
  Future<List<Tilawa>> getTilawatList() async {
    List data = await client.get(endpoint);
    return [for (Map e in data) Tilawa.fromJson(e)];
  }

  final noneMessage = 'ليس هناك تلاوات';
  Widget tilawatListBuilder() {
    return FutureBuilder<List<Tilawa>>(
      future: getTilawatList(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? snapshot.data!.isNotEmpty
                ? ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.white,
                      height: 2,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => TilawaHeaderWidget(
                      tilawa: snapshot.data![index],
                    ),
                  )
                : Center(
                    child: Text(
                      noneMessage,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}

mixin MessagesMixin {
  final recorder = FlutterSoundRecorder();
  String? endpoint;
  String? messageType;
  int? chatId;
  int? receiverId;
  WebSocketChannel? channel;

  String filePath = 'audio.aac';
  Future initRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw 'Microphone permission not granted';
    }

    await recorder.openRecorder();
    recorder.setSubscriptionDuration(const Duration(milliseconds: 1000));
  }

  Future<List<Message>> getMessages() async {
    List data = await client.get(
      '$endpoint/$chatId',
    );
    return [for (Map m in data) Message.fromJson(m)];
  }

  void sendMessage(String text) async {
    channel!.sink.add(jsonEncode({
      'type': messageType,
      'chatId': chatId,
      'senderId': Globals.userId,
      'receiverId': receiverId,
      'text': text,
    }));
  }

  Future<void> sendAudioMessage() async {
    File audio = File(filePath);
    await client.audioPost(
      '/chat/audio',
      file: await audio.readAsBytes(),
      data: {
        'type': messageType,
        'senderId': Globals.userId,
        'receiverId': receiverId,
        'chatId': chatId,
      },
    );
  }
}

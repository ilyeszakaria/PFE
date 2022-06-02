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
    List<ConversationModel> conversations = data
        .map(
          (e) => ConversationModel.fromJson(e),
        )
        .toList();
    return conversations;
  }

  Widget chatListBuilder() {
    return FutureBuilder<List<ConversationModel>>(
      future: getConvesationsList(),
      builder: (context, snapchot) {
        final conversations = snapchot.data;
        return ListView.separated(
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
  Future<List<Tilawa>> getTilawatList() async {
    List data =
        await client.get('/tilawat/${Globals.userId}?role=${Globals.role}');
    List<Tilawa> tilawat = data.map((e) => Tilawa.fromJson(e)).toList();
    return tilawat;
  }

  final noneMessage = 'ليس لديك تصحيحات';
  Widget tilawatListBuilder() {
    return FutureBuilder<List<Tilawa>>(
      future: getTilawatList(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? snapshot.data!.isNotEmpty
                ? ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.white,
                      height: 2,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) =>
                        TilawaHeaderWidget(tilawa: snapshot.data![index]),
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
      '$endpoint/${Globals.userId}?role=${Globals.role}',
    );
    List<Message> messages = data.map((e) => Message.fromJson(e)).toList();
    return messages;
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

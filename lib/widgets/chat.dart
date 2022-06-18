import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../mixins/chat.dart';
import '../models/messages.dart';
import '../pages/conversation.dart';
import '../pages/revision.dart';
import '../utils/client.dart';
import '../utils/prefs.dart';
import 'messages.dart';

class ChatHeaderWidget extends StatelessWidget {
  const ChatHeaderWidget({
    Key? key,
    required this.conversation,
  }) : super(key: key);

  final ConversationModel conversation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return Conversation(conversation: conversation);
        }));
      },
      child: ListTile(
        tileColor: Colors.grey[300],
        contentPadding: const EdgeInsets.all(8),
        title: Text(
          conversation.name,
          textAlign: TextAlign.right,
        ),
        trailing: const CircleAvatar(
          child: Icon(
            Icons.person,
            color: Colors.brown,
          ),
          radius: 25,
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}

class TilawaHeaderWidget extends StatelessWidget {
  const TilawaHeaderWidget({
    Key? key,
    required this.tilawa,
  }) : super(key: key);

  final Tilawa tilawa;

  @override
  Widget build(BuildContext context) {
    String format(String sora, int aya) =>
        '${sora.padRight(10)} ${aya.toString().padRight(3)}';
    String title =
        '${format(tilawa.startSora, tilawa.startAya)} إلى ${format(tilawa.endSora, tilawa.endAya)}';
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return Revision(tilawa: tilawa);
        }));
      },
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        tileColor: Colors.grey[300],
        title: Text(
          title,
          textAlign: TextAlign.right,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}

class ChatWidget extends StatefulWidget {
  ChatWidget({
    Key? key,
    required this.chatId,
    required this.endpoint,
    required this.receiverId,
    required this.messageType,
  }) : super(key: key);

  final int chatId;
  final String endpoint;
  final int receiverId;
  final String messageType;

  final _channel = WebSocketChannel.connect(
    Uri.parse('ws://$serverDomain/chat/ws/${Globals.userId}'),
  );
  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> with MessagesMixin {
  bool recording = false;
  List messages = [];

  @override
  int get receiverId => widget.receiverId;
  @override
  String get endpoint => widget.endpoint;
  @override
  String get messageType => widget.messageType;
  @override
  int get chatId => widget.chatId;

  @override
  get channel => widget._channel;
  final TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getMessages().then((_messages) {
      setState(() {
        messages = _messages;
      });
    });

    initRecorder();

    channel!.stream.listen((data) {
      Message message = Message.fromJson(jsonDecode(data));
      setState(() {
        messages.add(message);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: ListView.builder(
              itemCount: messages.length,
              shrinkWrap: false,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              itemBuilder: (context, index) {
                var message = messages[index];
                return message.isAudio
                    ? AudioMessageWidget(message)
                    : TextMessageWidget(message);
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 60,
            width: double.infinity,
            color: Colors.white,
            child: StatefulBuilder(
              builder: (context, _setState) {
                return Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () async {
                        if (!recording) {
                          await recorder.startRecorder(toFile: filePath);
                        } else {
                          filePath = (await recorder.stopRecorder())!;
                          await sendAudioMessage();
                        }
                        _setState(() => recording = !recording);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          recording ? Icons.stop : Icons.mic,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<RecordingDisposition>(
                        stream: recorder.onProgress,
                        builder: (context, snapshot) {
                          return recording
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Timer(recorder: recorder),
                                    const Text('يتم تسجيل صوتية'),
                                  ],
                                )
                              : TextField(
                                  textAlign: TextAlign.right,
                                  controller: messageController,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: const InputDecoration(
                                    hintStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'اكتب رسالة',
                                  ),
                                );
                        },
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        if (messageController.text.isEmpty) {
                          return;
                        }
                        sendMessage(messageController.text);
                        messageController.clear();
                      },
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 20,
                      ),
                      backgroundColor: Colors.brown,
                      elevation: 20,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

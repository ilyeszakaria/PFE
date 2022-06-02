import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../mixins/chat.dart';
import '../models/messages.dart';
import '../widgets/messages.dart';
import '../utils/prefs.dart';

class Conversation extends StatefulWidget {
  final ConversationModel conversation;
  const Conversation({Key? key, required this.conversation}) : super(key: key);

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> with MessagesMixin {
  final messageController = TextEditingController();
  var messages = [];
  bool recording = false;

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  final _channel = WebSocketChannel.connect(
    Uri.parse('ws://192.168.1.108:8000/chat/ws/${Globals.userId}'),
  );

  @override
  int get receiverId => widget.conversation.other.id;
  @override
  String get endpoint => '/messages';
  @override
  String get messageType => 'message';
  @override
  int get chatId => widget.conversation.id;
  @override
  get channel => _channel;
  @override
  void initState() {
    super.initState();
    getMessages().then((_messages) {
      setState(() {
        messages = _messages;
      });
    });

    _channel.stream.listen((data) {
      Message message = Message.fromJson(jsonDecode(data));
      setState(() {
        messages.add(message);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.conversation.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(
                  color: Colors.white,
                ),
                const CircleAvatar(
                  child: Icon(Icons.person),
                  backgroundColor: Colors.brown,
                  maxRadius: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
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
              padding: const EdgeInsets.only(
                left: 10,
                bottom: 10,
                top: 10,
              ),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: StatefulBuilder(builder: (context, _setState) {
                var _show = true;
                return Row(
                  children: <Widget>[
                    // Recorder
                    GestureDetector(
                      onTap: () {
                        _setState(() => recording = true);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.mic,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    StreamBuilder<RecordingDisposition>(
                        stream: recorder.onProgress,
                        builder: (context, snapshot) {
                          return Expanded(
                            child: TextField(
                              textAlign: TextAlign.right,
                              controller: messageController,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                  color: _show
                                      ? Colors.black54
                                      : Colors.transparent,
                                ),
                                border: InputBorder.none,
                                hintText: recording
                                    ? 'يتم تسجيل صوتية'
                                    : 'اكتب رسالة',
                              ),
                            ),
                          );
                        }),
                    FloatingActionButton(
                      onPressed: () {
                        if (messageController.text.isEmpty) {
                          return;
                        }
                        sendMessage(
                          messageController.text,
                        );
                        messageController.clear();
                      },
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 18,
                      ),
                      backgroundColor: Colors.brown,
                      elevation: 5,
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

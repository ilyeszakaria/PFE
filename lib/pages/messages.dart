import 'dart:convert';

import 'package:application3/models/messages.dart';
import 'package:application3/widgets/messages.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Messages extends StatefulWidget {
  final String username;
  const Messages({Key? key, required this.username}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  static Future<List<Message>> getMessages(BuildContext context) async {
    final assetBundel = DefaultAssetBundle.of(context);
    final data = await assetBundel.loadString('assets/message.json');
    final body = json.decode(data);
    return body.map<Message>(Message.fromJson).toList();
  }

  bool firstLoad = true;
  final messageController = TextEditingController();
  var _messages = [];

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  final channel = WebSocketChannel.connect(
    Uri.parse('ws://192.168.1.108:8000/chat/ws/1'),
  );

  @override
  void initState() {
    super.initState();
    getMessages(context).then((messages) {
      setState(() {
        _messages = messages;
      });
    });
    channel.stream.listen((data) {
      Message message = Message.fromJson(jsonDecode(data));
      setState(() {
        _messages.add(message);
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
                        widget.username,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Cairo'),
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
                itemCount: _messages.length,
                shrinkWrap: false,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                itemBuilder: (context, index) {
                  var message = _messages[index];
                  return message.audio == ''
                      ? TextMessageWidget(message)
                      : AudioMessageWidget(message);
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
              child: Row(
                children: <Widget>[
                  // Recorder
                  GestureDetector(
                    onTap: () {
                      print('hi');
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
                  // const SizedBox(
                  //   width: 15,
                  // ),
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.right,
                      controller: messageController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none,
                        hintText: 'اكتب رسالة',
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   width: 15,
                  // ),
                  FloatingActionButton(
                    onPressed: () {
                      channel.sink.add(messageController.text);
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}

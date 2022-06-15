import 'dart:convert';

import '../widgets/scaffold.dart';

import '../models/message_tilawa_model1.dart';
import 'package:flutter/material.dart';

class TestChat extends StatefulWidget {
  final String username = '';
  const TestChat({
    Key? key,
  }) : super(key: key);

  @override
  State<TestChat> createState() => _TestChatState();
}

class _TestChatState extends State<TestChat> {
  Future<List<MessageTilawa>> getmessageTilawa(BuildContext context) async {
    final assetBundel = DefaultAssetBundle.of(context);
    final data = await assetBundel.loadString('assets/MessageTilawa.json');
    final body = json.decode(data);
    return body.map<MessageTilawa>(MessageTilawa.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: 'الاختبار 1',
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 600,
            child: FutureBuilder<List<MessageTilawa>>(
              future: getmessageTilawa(context),
              builder: (context, snapshot) {
                final messagesTilawa = snapshot.data;
                return ListView.builder(
                  itemCount: messagesTilawa?.length ?? 0,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  itemBuilder: (context, index) {
                    final messageTilawa = messagesTilawa![index];
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Align(
                        alignment: (messageTilawa.sender != widget.username
                            ? Alignment.topLeft
                            : Alignment.topRight),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (messageTilawa.sender != widget.username
                                ? Colors.grey.shade200
                                : Colors.brown[200]),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            messageTilawa.audio,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {},
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
                    size: 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

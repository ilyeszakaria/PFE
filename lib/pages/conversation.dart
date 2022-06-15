import 'package:flutter/material.dart';

import '../models/messages.dart';
import '../widgets/chat.dart';

class Conversation extends StatelessWidget {
  final ConversationModel conversation;
  const Conversation({Key? key, required this.conversation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
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
                      conversation.name,
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
    );

    return Scaffold(
      appBar: appBar,
      body: ChatWidget(
        chatId: conversation.id,
        endpoint: '/messages',
        messageType: 'message',
        receiverId: conversation.other.id,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../models/messages.dart';
import '../pages/conversation.dart';
import '../pages/revision.dart';

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
        tileColor: Colors.grey,
        title: Text(
          title,
          textAlign: TextAlign.right,
          style: const TextStyle(fontSize: 14),
        ),
        leading: GestureDetector(
          child: const Icon(Icons.delete),
          onTap: () {
            print("supprimer");
          },
        ),
      ),
    );
  }
}

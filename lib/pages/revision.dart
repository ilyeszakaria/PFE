import '../widgets/chat.dart';
import '../models/messages.dart';
import 'package:flutter/material.dart';

class Revision extends StatelessWidget {
  final Tilawa tilawa;
  const Revision({
    Key? key,
    required this.tilawa,
  }) : super(key: key);

  int get receiverId => 2; //widget.tilawa.other.userId;

  @override
  Widget build(BuildContext context) {
    final pageTitle =
        'من ${tilawa.startSora} ${tilawa.startAya} إلى ${tilawa.endSora} ${tilawa.endAya}';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Center(
          child: Text(
            pageTitle,
            style: const TextStyle(fontSize: 13),
            textWidthBasis: TextWidthBasis.longestLine,
          ),
        ),
        elevation: 10,
        backgroundColor: Colors.brown[400],
      ),
      body: ChatWidget(
        chatId: tilawa.id,
        receiverId: receiverId,
        messageType: 'messageTilawa',
        endpoint: '/messages/tilawa',
      ),
    );
  }
}

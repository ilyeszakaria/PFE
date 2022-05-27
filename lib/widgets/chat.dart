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
      child: Container(
        child: Row(children: [
          Container(
            alignment: Alignment.center,
            height: 55,
            width: 150,
            child: Text(
              conversation.name,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            width: 80,
            height: 55,
            child: const CircleAvatar(
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
              backgroundColor: Color.fromARGB(255, 219, 219, 219),
            ),
          ),
        ], mainAxisAlignment: MainAxisAlignment.end),
        height: 70,
        decoration: BoxDecoration(
            color: Colors.grey,
            boxShadow: [const BoxShadow(blurRadius: 1)],
            borderRadius: BorderRadius.circular(3)),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return Revision(tilawa: tilawa);
        }));
      },
      child: Container(
        child: Row(children: [
          Container(
              width: 58,
              height: 100,
              child: GestureDetector(
                child: Icon(Icons.delete),
                onTap: () {
                  print("supprimer");
                },
              )),
          Container(
            height: 100,
            child: Column(children: [
              Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(tilawa.startAya.toString()),
                      alignment: Alignment.center,
                      width: 70,
                    ),
                    Container(
                      child: Text(
                        ":  الاية  رقم",
                      ),
                      alignment: Alignment.center,
                      width: 70,
                    ),
                    Container(
                      child: Text(tilawa.startSora),
                      alignment: Alignment.center,
                      width: 70,
                    ),
                    Container(
                      child: Text(
                        "  : من سورة    ",
                      ),
                      alignment: Alignment.center,
                      width: 100,
                    )
                  ],
                ),
              ),
              Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(tilawa.endAya.toString()),
                      alignment: Alignment.center,
                      width: 70,
                    ),
                    Container(
                      child: Text(
                        ":  الاية  رقم",
                      ),
                      alignment: Alignment.center,
                      width: 70,
                    ),
                    Container(
                      child: Text(tilawa.endSora),
                      alignment: Alignment.center,
                      width: 70,
                    ),
                    Container(
                      child: Text(
                        "  : الى سورة",
                      ),
                      alignment: Alignment.center,
                      width: 100,
                    )
                  ],
                ),
              )
            ]),
          ),
        ], mainAxisAlignment: MainAxisAlignment.end),
        height: 100,
        decoration: BoxDecoration(
            color: Colors.grey,
            boxShadow: [BoxShadow(blurRadius: 1)],
            borderRadius: BorderRadius.circular(3)),
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      ),
    );
  }
}

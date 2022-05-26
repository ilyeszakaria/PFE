import 'dart:convert';
import 'package:application3/models/users.dart';
import 'package:application3/pages/conversation.dart';
import 'package:application3/pages/revision.dart';
import 'package:application3/widgets/drawers.dart';
import 'package:application3/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/messageTilawaModel1.dart';
import '../models/messages.dart';

class StudentPage extends StatefulWidget {
  final User user;
  const StudentPage({Key? key, required this.user}) : super(key: key);

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<MessageTilawa1>> getmessage(BuildContext context) async {
    final assetBundel = DefaultAssetBundle.of(context);
    final data = await assetBundel.loadString('assets/MessageTilawa1.json');
    final body = json.decode(data);
    return body.map<MessageTilawa1>(MessageTilawa1.fromJson).toList();
  }

  Future<List<Message>> getmessage2(BuildContext context) async {
    final assetBundel = DefaultAssetBundle.of(context);
    final data = await assetBundel.loadString('assets/message.json');
    final body = json.decode(data);
    return body.map<Message>(Message.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    const pageTitle = 'الصفحة الرئيسية';
    return ScaffoldWidget(
      pageTitle: pageTitle,
      endDrawer: StudentDrawer(user: widget.user),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.topRight,
                  child: Column(
                    children: [
                      const Text(
                        "التلميذ",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo',
                        ),
                      ),
                      Text(
                        widget.user.name,
                        style: const TextStyle(
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  height: 105,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: const CircleAvatar(
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    radius: 30,
                    backgroundColor: Colors.grey,
                  ),
                  height: 80,
                  margin: const EdgeInsets.only(right: 10),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 33,
                  width: 210,
                  child: Column(children: [
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      height: 5,
                      width: 5,
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    Container(
                      height: 5,
                      width: 5,
                    ),
                  ]),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.centerRight,
                  child: const Text(
                    " : التصحيحات الواردة  ",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo'),
                  ),
                  height: 33,
                )
              ],
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 260,
                width: double.infinity,
                child: FutureBuilder<List<MessageTilawa1>>(
                  future: getmessage(context),
                  builder: (context, snapchot) {
                    final messages = snapchot.data;
                    return ListView.builder(
                      itemCount: messages?.length ?? 0,
                      itemBuilder: (context, index) {
                        final message = messages![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const Revision(
                                tilawaId: 0,
                                ayaDebut: 0,
                                ayaFin: 0,
                                souraDebut: "",
                                souraFin: "",
                                username: "",
                              );
                            }));
                          },
                          child: Container(
                            child: Row(children: [
                              Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Icon(Icons.play_arrow),
                                      const VerticalDivider(
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        message.time,
                                        style: const TextStyle(
                                          fontFamily: 'Cairo',
                                        ),
                                      ),
                                      const VerticalDivider(
                                        width: 100,
                                        color: Colors.grey,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 15),
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.topRight,
                                              height: 28,
                                              child: Text(
                                                message.username,
                                                style: const TextStyle(
                                                  fontFamily: 'Cairo',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                message.date,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 8,
                                                    fontFamily: 'Cairo'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const VerticalDivider(
                                        color: Colors.grey,
                                      ),
                                      const CircleAvatar(
                                        child: Icon(
                                          Icons.person,
                                          color: Colors.black,
                                          size: 30,
                                        ),
                                        backgroundColor:
                                            Color.fromARGB(255, 240, 238, 238),
                                        radius: 25,
                                      ),
                                    ],
                                  ))
                            ], mainAxisAlignment: MainAxisAlignment.end),
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                boxShadow: [const BoxShadow(blurRadius: 1)],
                                color: Colors.grey),
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                          ),
                        );
                      },
                    );
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 33,
                  width: 240,
                  child: Column(children: [
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      height: 5,
                      width: 5,
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    Container(
                      height: 5,
                      width: 5,
                    ),
                  ]),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.centerRight,
                  child: const Text(
                    ":الرسائل الواردة",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  height: 33,
                )
              ],
            ),
            Container(
              height: 260,
              width: double.infinity,
              child: FutureBuilder<List<Message>>(
                future: getmessage2(context),
                builder: (context, snapchot) {
                  final messages = snapchot.data;
                  return ListView.builder(
                    itemCount: messages?.length ?? 0,
                    itemBuilder: (context, index) {
                      final message = messages![index];
                      return GestureDetector(
                        onTap: () {
                          // Navigator.of(context).push(
                          //     MaterialPageRoute(builder: (context) {
                          //   return Conversation(
                          //     conversation: ,
                          //   );
                          // }));
                        },
                        child: ChatWidget(message: message),
                      );
                    },
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.play_arrow),
                const Text(
                  "0:45",
                  style: TextStyle(
                    fontFamily: 'Cairo',
                  ),
                ),
                const VerticalDivider(
                  width: 12,
                  color: Colors.grey,
                ),
                Text(
                  message.text,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                  ),
                ),
                const VerticalDivider(
                  width: 60,
                  color: Colors.grey,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        height: 28,
                        width: 70,
                        child: const Text(
                          "ilyes",
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: const Text(
                          "20/02/2022   12:30",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 8,
                              fontFamily: 'Cairo'),
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(
                  color: Colors.grey,
                ),
                const CircleAvatar(
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 30,
                  ),
                  backgroundColor: Color.fromARGB(255, 240, 238, 238),
                  radius: 25,
                ),
              ],
            ))
      ], mainAxisAlignment: MainAxisAlignment.end),
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          boxShadow: [BoxShadow(blurRadius: 1)],
          color: Colors.grey),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    );
  }
}

import 'dart:convert';

import 'package:application3/pages/messages.dart';
import 'package:application3/models/messageTilawaModel1.dart';
import 'package:flutter/material.dart';

class Conversaation extends StatefulWidget {
  final String username;
  const Conversaation({Key? key, required this.username}) : super(key: key);

  @override
  State<Conversaation> createState() => _ConversaationState();
}

class _ConversaationState extends State<Conversaation> {
  static Future<List<conversation>> getconvesation(BuildContext context) async {
    final assetBundel = DefaultAssetBundle.of(context);
    final data = await assetBundel.loadString('assets/conversation.json');
    final body = json.decode(data);
    return body.map<conversation>(conversation.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "                      المحادثات  ",
            style: TextStyle(fontFamily: 'Cairo'),
          ),
          elevation: 10,
          backgroundColor: Colors.brown[400]),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          height: double.infinity,
          width: double.infinity,
          child: FutureBuilder<List<conversation>>(
            future: getconvesation(context),
            builder: (context, snapchot) {
              final conversations = snapchot.data;
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.white,
                    height: 2,
                  );
                },
                itemCount: conversations?.length ?? 0,
                itemBuilder: (context, index) {
                  final conversation = conversations![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Messages(username: widget.username);
                      }));
                    },
                    child: Container(
                      child: Row(children: [
                        Container(
                          alignment: Alignment.center,
                          height: 55,
                          width: 150,
                          child: Text(
                            conversation.username,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                fontFamily: 'Cairo'),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 55,
                          child: CircleAvatar(
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
                          boxShadow: [BoxShadow(blurRadius: 1)],
                          borderRadius: BorderRadius.circular(3)),
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    ),
                  );
                },
              );
            },
          )),
    );
  }
}

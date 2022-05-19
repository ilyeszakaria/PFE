import 'dart:convert';
import 'package:application3/Conversations.dart';
import 'package:application3/ListeMessageTilawa.dart';
import 'package:application3/ListeRevision.dart';
import 'package:application3/ListeTestStudent.dart';
import 'package:application3/Messages.dart';
import 'package:application3/Revision.dart';
import 'package:application3/doaah.dart';
import 'package:application3/file2.dart';
import 'package:application3/models/messageTilawaModel1.dart';
import 'package:application3/parametre.dart';
import 'package:application3/screens.dart/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Studentpage extends StatefulWidget {
  final String username;
  const Studentpage({Key? key, required this.username}) : super(key: key);

  @override
  State<Studentpage> createState() => _StudentpageState();
}

class _StudentpageState extends State<Studentpage> {
  @override
  void initState() {
    super.initState();
  }

  static Future<List<MessageTilawa1>> getmessage(BuildContext context) async {
    final assetBundel = DefaultAssetBundle.of(context);
    final data = await assetBundel.loadString('assets/MessageTilawa1.json');
    final body = json.decode(data);
    return body.map<MessageTilawa1>(MessageTilawa1.fromJson).toList();
  }

  static Future<List<Message>> getmessage2(BuildContext context) async {
    final assetBundel = DefaultAssetBundle.of(context);
    final data = await assetBundel.loadString('assets/message.json');
    final body = json.decode(data);
    return body.map<Message>(Message.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              "الصفحة الرئيسية",
              style: TextStyle(fontFamily: 'Cairo'),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          elevation: 10,
          backgroundColor: Colors.brown[400]),
      endDrawer: Drawer(
        child: Column(children: [
          UserAccountsDrawerHeader(
            accountName: Text("بغدالي الياس زكريا",
                style: TextStyle(fontFamily: 'Cairo')),
            accountEmail: Text("baghdaliilyeszakaria@gmail.com",
                style: TextStyle(fontFamily: 'Cairo')),
            currentAccountPicture: CircleAvatar(
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
              backgroundColor: Colors.grey,
            ),
            decoration: BoxDecoration(color: Colors.brown[400]),
          ),
          ListTile(
            title: Text(
              "                              اعدادات الحساب   ",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return parametre(username: widget.username);
              }));
            },
            leading: Icon(Icons.settings),
          ),
          ListTile(
            title: Text(
              "                              سجل المراجعات",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ListeRevision(username: widget.username);
              }));
            },
            leading: Icon(Icons.list),
          ),
          ListTile(
              title: Text(
                "                                         اختبارات",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ListeTestStudent(username: widget.username);
                }));
              },
              leading: Icon(Icons.list)),
          ListTile(
            title: Text(
              "                                          محادثات",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Conversaation(username: widget.username);
              }));
            },
            leading: Icon(Icons.sms),
          ),
          ListTile(
            title: Text(
              "                                         المصحف",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return file2();
              }));
            },
            leading: Icon(Icons.menu_book),
          ),
          ListTile(
            title: Text(
              "                              دعاء ختم القران",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Doaah();
              }));
            },
            leading: Container(
              width: 25,
              height: 25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "img/istockphoto-1206960091-1024x1024 (2).jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              "                                تسجيل الخروج",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
            ),
            onTap: () {},
            leading: Icon(Icons.logout),
          ),
        ]),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[
            Container(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 1, vertical: 3),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: Column(
                            children: [
                              Text(
                                "التلميذ  ",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo'),
                              ),
                              Text(widget.username,
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          height: 105,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: CircleAvatar(
                            child: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            radius: 30,
                            backgroundColor: Colors.grey,
                          ),
                          height: 80,
                          margin: EdgeInsets.only(right: 10),
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
                              margin: EdgeInsets.only(top: 4),
                              height: 5,
                              width: 5,
                            ),
                            Divider(
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
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          alignment: Alignment.centerRight,
                          child: Text(
                            " : التصحيحات الواردة  ",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo'),
                          ),
                          height: 33,
                        )
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
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
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return Revision(
                                          idtilawa: "",
                                          AyaDebut: "",
                                          AyaFin: "",
                                          SouraDebut: "",
                                          SouraFin: "",
                                          username: "");
                                    }));
                                  },
                                  child: Container(
                                    child: Row(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Icon(Icons.play_arrow),
                                                  VerticalDivider(
                                                    color: Colors.grey,
                                                  ),
                                                  Text(message.time,
                                                      style: TextStyle(
                                                          fontFamily: 'Cairo')),
                                                  VerticalDivider(
                                                    width: 100,
                                                    color: Colors.grey,
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 15),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .topRight,
                                                          height: 28,
                                                          child: Text(
                                                            message.username,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Text(
                                                            message.date,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 8,
                                                                fontFamily:
                                                                    'Cairo'),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  VerticalDivider(
                                                    color: Colors.grey,
                                                  ),
                                                  CircleAvatar(
                                                    child: Icon(
                                                      Icons.person,
                                                      color: Colors.black,
                                                      size: 30,
                                                    ),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 240, 238, 238),
                                                    radius: 25,
                                                  ),
                                                ],
                                              ))
                                        ],
                                        mainAxisAlignment:
                                            MainAxisAlignment.end),
                                    height: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        boxShadow: [BoxShadow(blurRadius: 1)],
                                        color: Colors.grey),
                                    width: double.infinity,
                                    margin: EdgeInsets.symmetric(
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
                              margin: EdgeInsets.only(top: 4),
                              height: 5,
                              width: 5,
                            ),
                            Divider(
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
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          alignment: Alignment.centerRight,
                          child: Text(
                            " : الرسائل الواردة  ",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo'),
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
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return Messages(
                                        username: widget.username,
                                      );
                                    }));
                                  },
                                  child: Container(
                                    child: Row(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Icon(Icons.play_arrow),
                                                  Text("0:45",
                                                      style: TextStyle(
                                                          fontFamily: 'Cairo')),
                                                  VerticalDivider(
                                                    width: 12,
                                                    color: Colors.grey,
                                                  ),
                                                  Text(message.text,
                                                      style: TextStyle(
                                                          fontFamily: 'Cairo')),
                                                  VerticalDivider(
                                                    width: 60,
                                                    color: Colors.grey,
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 15),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          height: 28,
                                                          width: 70,
                                                          child: Text(
                                                            "ilyes",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Text(
                                                            "20/02/2022   12:30",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 8,
                                                                fontFamily:
                                                                    'Cairo'),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  VerticalDivider(
                                                    color: Colors.grey,
                                                  ),
                                                  CircleAvatar(
                                                    child: Icon(
                                                      Icons.person,
                                                      color: Colors.black,
                                                      size: 30,
                                                    ),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 240, 238, 238),
                                                    radius: 25,
                                                  ),
                                                ],
                                              ))
                                        ],
                                        mainAxisAlignment:
                                            MainAxisAlignment.end),
                                    height: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        boxShadow: [BoxShadow(blurRadius: 1)],
                                        color: Colors.grey),
                                    width: double.infinity,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 2),
                                  ),
                                );
                              },
                            );
                          },
                        )),
                  ]),
                ))
          ],
        ),
      ),
    );
  }
}

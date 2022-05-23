import 'dart:convert';
import 'package:application3/pages/conversations.dart';
import 'package:application3/pages/liste_eleve.dart';
import 'package:application3/pages/liste_test_teacher.dart';
import 'package:application3/file2.dart';
import 'package:application3/models/messageTilawaModel1.dart';
import 'package:application3/pages/parametre.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TeacherPage extends StatefulWidget {
  final String username;
  const TeacherPage({Key? key, required this.username}) : super(key: key);

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
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
          title: Text(
            "                        الصفحة الرئيسية  ",
            style: TextStyle(fontFamily: 'Cairo'),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
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
              "                                           تلاميذي",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ListeEleve(username: widget.username);
              }));
            },
            leading: Icon(Icons.list),
          ),
          ListTile(
              title: Text(
                "                                           اختبارات",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ListeTestTeacher(username: widget.username);
                }));
              },
              leading: Icon(Icons.my_library_books_sharp)),
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
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(5),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              alignment: Alignment.topRight,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topCenter,
                                    height: 60,
                                    child: Text(
                                      "المعلم  ",
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Cairo'),
                                    ),
                                  ),
                                  Text(
                                    widget.username,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
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
                              margin: EdgeInsets.only(left: 0),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 200,
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
                                " : التلاوات الواردة     ",
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
                                        print("ilyes");
                                      },
                                      child: Container(
                                        child: Row(
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Container(),
                                                      Container(
                                                        child: Icon(
                                                            Icons.play_arrow),
                                                        margin: EdgeInsets.only(
                                                            right: 20),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            right: 0),
                                                        child: Text(
                                                            message.time,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Cairo')),
                                                      ),
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
                                                              alignment:
                                                                  Alignment
                                                                      .topRight,
                                                              height: 28,
                                                              child: Text(
                                                                message
                                                                    .username,
                                                                style:
                                                                    TextStyle(
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
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 20),
                                                        color: Colors.grey,
                                                        child: CircleAvatar(
                                                          child: Icon(
                                                            Icons.person,
                                                            color: Colors.black,
                                                            size: 30,
                                                          ),
                                                          backgroundColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  240,
                                                                  238,
                                                                  238),
                                                          radius: 25,
                                                        ),
                                                      )
                                                    ],
                                                  ))
                                            ],
                                            mainAxisAlignment:
                                                MainAxisAlignment.end),
                                        height: 60,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            boxShadow: [
                                              BoxShadow(blurRadius: 1)
                                            ],
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
                        Divider(
                          color: Colors.white,
                          height: 10,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 33,
                              width: 200,
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
                              margin: EdgeInsets.only(right: 20),
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
                            child: ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    print("ilyes");
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
                                                  Text(
                                                    "0:45",
                                                    style: TextStyle(
                                                        fontFamily: 'Cairo'),
                                                  ),
                                                  VerticalDivider(
                                                    width: 12,
                                                    color: Colors.grey,
                                                  ),
                                                  Text(
                                                    "...سلام",
                                                    style: TextStyle(
                                                        fontFamily: 'Cairo'),
                                                  ),
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
                                                          height: 27,
                                                          child: Text(
                                                            "ilyes",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    'Cairo'),
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
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: 0),
                                                    child: CircleAvatar(
                                                      child: Icon(
                                                        Icons.person,
                                                        color: Colors.black,
                                                        size: 30,
                                                      ),
                                                      backgroundColor:
                                                          Color.fromARGB(255,
                                                              240, 238, 238),
                                                      radius: 25,
                                                    ),
                                                  )
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
                            )),
                      ]),
                    )))
          ],
        ),
      ),
    );
    ;
  }
}

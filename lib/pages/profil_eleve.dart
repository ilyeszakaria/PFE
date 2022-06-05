import 'dart:convert';

import '../models/messageTilawaModel1.dart';
import 'test_chat.dart';
import 'revision.dart';
import '../models/messages.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfilEleve extends StatefulWidget {
  final String idstudent;
  final String username;
  ProfilEleve({Key? key, required this.idstudent, required this.username})
      : super(key: key);

  @override
  State<ProfilEleve> createState() => _ProfilEleveState();
}

class _ProfilEleveState extends State<ProfilEleve> {
  static Future<List<TestStudent>> getTestStudent(BuildContext context) async {
    final assetBundel = DefaultAssetBundle.of(context);
    final data = await assetBundel.loadString('assets/TestStudent.json');
    final body = json.decode(data);
    return body.map<TestStudent>(TestStudent.fromJson).toList();
  }

  static Future<List<Tilawa>> getTilawa(BuildContext context) async {
    final assetBundel = DefaultAssetBundle.of(context);
    final data = await assetBundel.loadString('assets/Tilawa.json');
    final body = json.decode(data);
    return body.map<Tilawa>(Tilawa.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "                  حساب التلميذ ",
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
                          padding: EdgeInsets.only(right: 70),
                          child: CircularPercentIndicator(
                            radius: 40,
                            center: Text(
                              "35%",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                            lineWidth: 10,
                            progressColor: Color.fromARGB(255, 148, 127, 119),
                            percent: 0.35,
                          ),
                        ),
                        Container(
                          child: Container(
                              margin: EdgeInsets.only(top: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 0),
                                    alignment: Alignment.topRight,
                                    height: 25,
                                    width: 80,
                                    child: Text("Abdeljalil",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  Container(
                                    alignment: Alignment.topRight,
                                    height: 25,
                                    width: 80,
                                    child: Text("Harzoat",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ],
                              )),
                          height: 80,
                          width: 90,
                          margin: EdgeInsets.only(top: 0),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Column(
                            children: [
                              Container(
                                child: CircleAvatar(
                                  child: Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Colors.black,
                                  ),
                                  backgroundColor: Colors.grey,
                                ),
                                height: 85,
                                width: 110,
                                margin: EdgeInsets.only(top: 15),
                              ),
                            ],
                          ),
                          height: 105,
                          width: 105,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 50,
                          width: 180,
                          child: Column(children: [
                            Container(
                              margin: EdgeInsets.only(top: 17),
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
                            "   : قائمة المراجعات  ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          height: 37,
                        )
                      ],
                    ),
                    Container(
                        height: 340,
                        width: double.infinity,
                        child: FutureBuilder(
                          future: getTilawa(context),
                          builder:
                              (context, AsyncSnapshot<List<Tilawa>> snapchot) {
                            final tilawas = snapchot.data;
                            return ListView.builder(
                              itemCount: tilawas?.length ?? 0,
                              itemBuilder: (context, index) {
                                final tilawa = tilawas![index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return Revision(tilawa: tilawa);
                                    }));
                                  },
                                  child: Container(
                                    child: Row(
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 100,
                                            child: Column(
                                              children: [
                                                Divider(
                                                  height: 10,
                                                  color: Colors.grey,
                                                ),
                                              ],
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                          Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          height: 40,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                tilawa.startAya
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Cairo'),
                                                              ),
                                                              Text(
                                                                  "   : اللاية رقم   ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontFamily:
                                                                          'Cairo')),
                                                              Text(
                                                                tilawa
                                                                    .startSora,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Cairo'),
                                                              ),
                                                              Text(
                                                                  "   : من سورة",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontFamily:
                                                                          'Cairo'))
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          height: 40,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                tilawa.endAya
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Cairo'),
                                                              ),
                                                              Text(
                                                                  "   : اللاية رقم      ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontFamily:
                                                                          'Cairo')),
                                                              Text(
                                                                tilawa
                                                                    .startSora,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Cairo'),
                                                              ),
                                                              Text(
                                                                  "   : الى سورة",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontFamily:
                                                                          'Cairo'))
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  VerticalDivider(
                                                    color: Colors.grey,
                                                  ),
                                                ],
                                              )),
                                        ],
                                        mainAxisAlignment:
                                            MainAxisAlignment.end),
                                    height: 80,
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
                          height: 50,
                          width: 200,
                          child: Column(children: [
                            Container(
                              margin: EdgeInsets.only(top: 17),
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
                            " :قائمة الاختبارات  ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          height: 37,
                        )
                      ],
                    ),
                    Container(
                        height: 200,
                        width: double.infinity,
                        child: FutureBuilder<List<TestStudent>>(
                          future: getTestStudent(context),
                          builder: (context, snapchot) {
                            final tests = snapchot.data;
                            return ListView.builder(
                              itemCount: tests?.length ?? 0,
                              itemBuilder: (context, index) {
                                final test = tests![index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return TestChat();
                                    }));
                                  },
                                  child: Container(
                                    child: Row(
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 100,
                                            child: Text(
                                              test.date,
                                              style: TextStyle(),
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                          Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          height: 40,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                test.AyaDebut,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Cairo'),
                                                              ),
                                                              Text(
                                                                  "   : اللاية رقم   ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontFamily:
                                                                          'Cairo')),
                                                              Text(
                                                                test.SouraDebut,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Cairo'),
                                                              ),
                                                              Text(
                                                                  "   : من سورة",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontFamily:
                                                                          'Cairo'))
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          height: 40,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                test.AyaFin,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Cairo'),
                                                              ),
                                                              Text(
                                                                  "   : اللاية رقم      ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontFamily:
                                                                          'Cairo')),
                                                              Text(
                                                                test.SouraFin,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Cairo'),
                                                              ),
                                                              Text(
                                                                  "   : الى سورة",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontFamily:
                                                                          'Cairo'))
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  VerticalDivider(
                                                    color: Colors.grey,
                                                  ),
                                                ],
                                              )),
                                        ],
                                        mainAxisAlignment:
                                            MainAxisAlignment.end),
                                    height: 80,
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

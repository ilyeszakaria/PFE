import 'dart:convert';
import 'package:application3/pages/reponse_test.dart';
import 'package:application3/pages/test.dart';
import 'package:application3/models/messageTilawaModel1.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListeTestTeacher extends StatefulWidget {
  final String username;
  const ListeTestTeacher({Key? key, required this.username}) : super(key: key);

  @override
  State<ListeTestTeacher> createState() => _ListeTestTeacherState();
}

class _ListeTestTeacherState extends State<ListeTestTeacher> {
  static Future<List<TestTeacher>> getTestTeacher(BuildContext context) async {
    final assetBundel = DefaultAssetBundle.of(context);
    final data = await assetBundel.loadString('assets/TestTeacher.json');
    final body = json.decode(data);
    return body.map<TestTeacher>(TestTeacher.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "                      الاختبارات  ",
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
                    child: Column(
                      children: [
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
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              alignment: Alignment.topRight,
                              child: Text(
                                " : سجل الختبارات      ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              height: 35,
                            )
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            height: 700,
                            width: double.infinity,
                            child: FutureBuilder<List<TestTeacher>>(
                              future: getTestTeacher(context),
                              builder: (context, snapchot) {
                                final tests = snapchot.data;
                                return ListView.builder(
                                  itemCount: tests?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    final test = tests![index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return ReponceTest(
                                              idtest: test.id,
                                              SouraDebut: test.SouraDebut,
                                              SouraFin: test.SouraFin,
                                              AyaDebut: test.AyaDebut,
                                              AyaFin: test.AyaFin,
                                              datetest: test.date,
                                              username: widget.username);
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
                                                                          fontWeight: FontWeight
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
                                                                          fontWeight: FontWeight
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
                                                                          fontWeight: FontWeight
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
                                                                          fontWeight: FontWeight
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
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            boxShadow: [
                                              BoxShadow(blurRadius: 1)
                                            ],
                                            color: Colors.grey),
                                        width: double.infinity,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 2),
                                      ),
                                    );
                                  },
                                );
                              },
                            )),
                      ],
                    )))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Test();
          }));
        },
        label: Text(
          "بدء اختبار",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: Icon(
          Icons.add,
          size: 30,
        ),
        backgroundColor: Colors.brown[400],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

import 'dart:convert';
import 'package:application3/pages/message_test_teacher.dart';
import 'package:application3/models/messageTilawaModel1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReponceTest extends StatefulWidget {
  final String idtest;
  final String AyaDebut;
  final String AyaFin;
  final String datetest;
  final String SouraDebut;
  final String SouraFin;
  final String username;

  const ReponceTest(
      {Key? key,
      required this.idtest,
      required this.AyaDebut,
      required this.AyaFin,
      required this.datetest,
      required this.SouraDebut,
      required this.SouraFin,
      required this.username})
      : super(key: key);

  @override
  State<ReponceTest> createState() => _ReponceTestState();
}

class _ReponceTestState extends State<ReponceTest> {
  static Future<List<Reponce>> getReponce(BuildContext context) async {
    final assetBundel = DefaultAssetBundle.of(context);
    final data = await assetBundel.loadString('assets/Reponce.json');
    final body = json.decode(data);
    return body.map<Reponce>(Reponce.formJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "                          اختبار   ",
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
                    Column(
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
                              margin: EdgeInsets.only(right: 20),
                              alignment: Alignment.centerRight,
                              child: Text(
                                "   :الاختبار",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              height: 45,
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.AyaDebut,
                          ),
                          Text(
                            "  : الاية رقم   ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.white,
                          ),
                          Text(
                            widget.SouraDebut,
                          ),
                          VerticalDivider(
                            color: Colors.white,
                          ),
                          Text(
                            "من سورة    ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      height: 65,
                      width: double.infinity,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.AyaFin,
                          ),
                          Text(
                            " : الاية رقم   ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.white,
                          ),
                          Text(
                            widget.SouraFin,
                          ),
                          VerticalDivider(
                            color: Colors.white,
                          ),
                          Text(
                            "الى سورة   ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      height: 65,
                      width: double.infinity,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.calendar_month, color: Colors.brown),
                          Text(
                            "   ${widget.datetest}",
                          ),
                          VerticalDivider(
                            color: Colors.white,
                          ),
                          Text(
                            "  :اخر اجل يوم     ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      height: 65,
                      width: double.infinity,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.watch_later,
                                color: Colors.brown,
                              ),
                              VerticalDivider(
                                color: Colors.white,
                              ),
                              Text(
                                "15:30",
                              ),
                              VerticalDivider(
                                color: Colors.white,
                              ),
                              Text(
                                ":على الساعة    ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      height: 65,
                      width: double.infinity,
                    ),
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
                            ":الاجابات  ",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          height: 45,
                        )
                      ],
                    ),
                    Container(
                        height: 260,
                        width: double.infinity,
                        child: FutureBuilder<List<Reponce>>(
                          future: getReponce(context),
                          builder: (context, snapchot) {
                            final reponces = snapchot.data;
                            return ListView.builder(
                              itemCount: reponces?.length ?? 0,
                              itemBuilder: (context, index) {
                                final reponce = reponces![index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return MessageTestTeacher(
                                        idtest: "",
                                        idstudent: "",
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
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 15),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          width: 230,
                                                          child: Text(
                                                            reponce.username,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    'Cairo'),
                                                          ),
                                                        ),
                                                        Divider(
                                                          height: 8,
                                                        ),
                                                        Container(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          width: 130,
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
                                    color: Colors.grey,
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

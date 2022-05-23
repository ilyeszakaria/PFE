import 'dart:convert';
import 'package:quran/quran.dart' as quran;
import 'package:application3/file1.dart';
import 'package:application3/models/messageTilawaModel1.dart';
import 'package:flutter/material.dart';

class Moshaf extends StatefulWidget {
  Moshaf({Key? key}) : super(key: key);

  @override
  State<Moshaf> createState() => _MoshafState();
}

class _MoshafState extends State<Moshaf> {
  static Future<List<sorah>> getsurah(BuildContext context) async {
    final assetBundel = DefaultAssetBundle.of(context);
    final data = await assetBundel.loadString('assets/sorah.json');
    final body = json.decode(data);
    return body.map<sorah>(sorah.fromJson).toList();
  }

  String place(String place) {
    if (place == "Makkah") {
      return "مكية";
    } else {
      return "مدنية";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          child: Text(
            "المصحف",
            style: TextStyle(fontFamily: 'Cairo'),
          ),
          alignment: Alignment.center,
        ),
        backgroundColor: Colors.brown,
      ),
      body: Container(
          child: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.white,
            height: 2,
          );
        },
        itemCount: 114,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return file1(
                    id: index + 1,
                  );
                }));
              },
              child: Container(
                  height: 120,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(left: 20),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text("${quran.getVerseCount(index + 1)}",
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600)),
                            VerticalDivider(
                              color: Colors.white,
                            ),
                            Text(
                              "و آياتها",
                              style: TextStyle(
                                  fontFamily: 'kitab',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      )),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 25),
                            width: 200,
                            alignment: Alignment.centerRight,
                            child: Text(
                              quran.getSurahNameArabic(index + 1),
                              style: TextStyle(
                                  fontFamily: 'kitab',
                                  fontSize: 35,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 25),
                            width: 200,
                            alignment: Alignment.bottomRight,
                            child: Text(
                              place(quran.getPlaceOfRevelation(index + 1)),
                              style:
                                  TextStyle(fontFamily: 'kitab', fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )));
        },
      )),
    );
  }
}

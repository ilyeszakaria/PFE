import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListeMessageTilawa extends StatefulWidget {
  ListeMessageTilawa({Key? key}) : super(key: key);

  @override
  State<ListeMessageTilawa> createState() => _ListeMessageTilawaState();
}

class _ListeMessageTilawaState extends State<ListeMessageTilawa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "                          قائمة التلاوات    ",
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
                          height: 50,
                          width: 210,
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
                          alignment: Alignment.centerRight,
                          child: Text(
                            " : التصحيحات الواردة  ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          height: 33,
                          width: 180,
                        )
                      ],
                    ),
                    Container(
                        height: 700,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                print("ilyes");
                              },
                              child: Container(
                                child: Row(children: [
                                  Container(
                                      height: 80,
                                      width: 100,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 40,
                                            child: Text(
                                              "    15/12/2021 ",
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.play_arrow,
                                                size: 25,
                                              ),
                                              VerticalDivider(
                                                color: Colors.grey,
                                              ),
                                              Text(
                                                "2:34",
                                              )
                                            ],
                                          )
                                        ],
                                      )),
                                  Container(
                                      height: 80,
                                      width: 100,
                                      child: Column(
                                        children: [
                                          Text("     10  البقرة "),
                                          Text(" الى "),
                                          Text("     40  البقرة "),
                                        ],
                                      )),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 80,
                                    width: 120,
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.bottomCenter,
                                          child: Text("ilyes"),
                                          height: 35,
                                        ),
                                        Text("baghdali")
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: 50,
                                    height: 50,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(255, 218, 218, 218),
                                      radius: 22,
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ], mainAxisAlignment: MainAxisAlignment.end),
                                height: 80,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    boxShadow: [BoxShadow(blurRadius: 1)],
                                    borderRadius: BorderRadius.circular(3)),
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                              ),
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

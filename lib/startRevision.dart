import 'package:application3/ListeRevision.dart';
import 'package:application3/Revision.dart';
import 'package:application3/models/messageTilawaModel1.dart';
import 'package:application3/utils/client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utils/client.dart';

class startRevision extends StatefulWidget {
  startRevision({Key? key}) : super(key: key);

  @override
  State<startRevision> createState() => _startRevisionState();
}

class _startRevisionState extends State<startRevision> {
  int startSora = 1;
  int endSora = 1;
  int _startAya = 1;
  int _endAya = 1;
  List<Map<String, dynamic>> sorat = [];

  Future<dynamic> getSourat() async {
    List<dynamic> _sorat = await client.get('/sora');
    sorat = (_sorat).cast<Map<String, dynamic>>();
    return _sorat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "تلاوة",
            style: TextStyle(fontFamily: 'Cairo'),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop()),
          elevation: 10,
          backgroundColor: Colors.brown[400],
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: FutureBuilder(
              future: getSourat(),
              builder: (context, snapshot) {
                return Stack(
                  children: <Widget>[
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: 1,
                          vertical: 3,
                        ),
                        child: Column(children: [
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.centerRight,
                                width: double.infinity,
                                height: 60,
                                child: Text(
                                  ": بدا تلاوة  ",
                                  style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo',
                                  ),
                                ),
                              )
                            ],
                          ),
                          Divider(
                            height: 30,
                            thickness: 1,
                            color: Colors.black,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 45,
                                  width: 50,
                                  child: TextFormField(
                                    textAlign: TextAlign.end,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Cairo',
                                    ),
                                    cursorColor: Colors.brown,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.brown,
                                    ),
                                  ),
                                ),
                                Text(
                                  " :الاية رقم",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Cairo',
                                  ),
                                ),
                                VerticalDivider(
                                  color: Colors.white,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 45,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.brown,
                                    ),
                                  ),
                                  child: DropdownButton<int>(
                                    value: startSora,
                                    icon: const Icon(Icons.arrow_downward),
                                    elevation: 16,
                                    underline: Container(
                                      height: 2,
                                    ),
                                    onChanged: (int? newValue) {
                                      setState(() {
                                        startSora = newValue!;
                                      });
                                    },
                                    items: sorat
                                        .map<DropdownMenuItem<int>>(
                                          (Map value) => DropdownMenuItem<int>(
                                            value: value['id'],
                                            child: Text(
                                              value['name'],
                                              style: TextStyle(
                                                fontFamily: 'Cairo',
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                VerticalDivider(
                                  color: Colors.white,
                                ),
                                Text(
                                  "من سورة    ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Cairo'),
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
                                Container(
                                  height: 45,
                                  child: TextFormField(
                                    textAlign: TextAlign.end,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Cairo'),
                                    cursorColor: Colors.brown,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                  width: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 3, color: Colors.brown)),
                                ),
                                Text(
                                  " : الاية رقم   ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Cairo'),
                                ),
                                VerticalDivider(
                                  color: Colors.white,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 3, color: Colors.brown)),
                                  child: DropdownButton<int>(
                                    value: endSora,
                                    icon: const Icon(Icons.arrow_downward),
                                    elevation: 16,
                                    underline: Container(
                                      height: 2,
                                    ),
                                    onChanged: (int? newValue) {
                                      setState(() {
                                        endSora = newValue!;
                                      });
                                    },
                                    items: sorat
                                        .map<DropdownMenuItem<int>>(
                                          (Map value) => DropdownMenuItem<int>(
                                            value: value['id'],
                                            child: Text(
                                              value['name'],
                                              style: TextStyle(
                                                fontFamily: 'Cairo',
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                VerticalDivider(
                                  color: Colors.white,
                                ),
                                Text(
                                  "الى سورة",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Cairo'),
                                )
                              ],
                            ),
                            height: 65,
                            width: double.infinity,
                          ),
                          Divider(
                            color: Colors.black,
                            height: 30,
                            thickness: 1,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            alignment: Alignment.center,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return ListeRevision(
                                    username: "",
                                  );
                                }));
                              },
                              color: Colors.brown,
                              child: Text(
                                "بدا المراجعة",
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ),
                            height: 150,
                            width: double.infinity,
                          ),
                        ]),
                      ),
                    ),
                  ],
                );
              }),
        ));
  }
}

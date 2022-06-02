import 'package:application3/models/messages.dart';
import 'package:application3/pages/revision.dart';
import 'package:application3/utils/client.dart';
import 'package:application3/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/client.dart';

class StartRevision extends StatefulWidget {
  const StartRevision({Key? key}) : super(key: key);

  @override
  State<StartRevision> createState() => _StartRevisionState();
}

class _StartRevisionState extends State<StartRevision> {
  int startSora = 1;
  int endSora = 1;
  int startAya = 1;
  int endAya = 1;
  List<Map<String, dynamic>> sorat = [];

  Future<dynamic> getSourat() async {
    List<dynamic> _sorat = await client.get('/sora');
    sorat = (_sorat).cast<Map<String, dynamic>>();
    return _sorat;
  }

  Future<Tilawa> createTilawa() async {
    var res = await client.post('/tilawa', body: {
      "startAya": startAya,
      "startSora": startSora,
      "endAya": endAya,
      "endSora": endSora,
    });
    return Tilawa.fromJson(res);
  }

  @override
  void initState() {
    super.initState();
    getSourat().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    const pageTitle = 'تلاوة';
    return ScaffoldWidget(
      pageTitle: pageTitle,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            child: const Text(
              "بدء تلاوة",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
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
                    onChanged: (value) {
                      if (value == '') {
                        startAya = 1;
                      } else {
                        startAya = int.parse(value);
                      }
                    },
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
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
                Text("الاية رقم"),
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
                                fontSize: 14,
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
                Text("من سورة"),
              ],
            ),
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
                    onChanged: (value) {
                      if (value == '') {
                        endAya = 1;
                      } else {
                        endAya = int.parse(value);
                      }
                    },
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    cursorColor: Colors.brown,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.brown)),
                ),
                Text("الاية رقم"),
                VerticalDivider(
                  color: Colors.white,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.brown),
                  ),
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
                            alignment: AlignmentDirectional.centerEnd,
                            child: Text(
                              value['name'],
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
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
                Text("الى سورة")
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.center,
            child: RaisedButton(
              onPressed: () async {
                var data = await createTilawa();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Revision(
                    tilawa: data,
                  );
                }));
              },
              color: Colors.brown,
              child: Text(
                "بدء المراجعة",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            height: 150,
            width: double.infinity,
          ),
        ]),
      ),
    );
  }
}

import '../models/messages.dart';
import '../pages/revision.dart';
import '../utils/client.dart';
import '../utils/prefs.dart';
import '../widgets/input.dart';
import '../widgets/scaffold.dart';
import 'package:flutter/material.dart';

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
    var res = await client.post('/tilawa/${Globals.userId}', body: {
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
    List<DropdownMenuItem<int>> soratList = [
      for (Map value in sorat)
        DropdownMenuItem<int>(
          alignment: Alignment.centerRight,
          value: value['id'],
          child: Text(
            value['name'].padRight(10),
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 14),
          ),
        ),
    ];

    List<DropdownMenuItem<int>>? numOfAyatStart, numOfAyatEnd;
    if (sorat.isNotEmpty) {
      numOfAyatStart = [
        for (var i = 1; i <= sorat[startSora - 1]['numOfAyat']; i++)
          numAyatItemBuilder(i)
      ];
      numOfAyatEnd = [
        for (var i = 1; i <= sorat[endSora - 1]['numOfAyat']; i++)
          numAyatItemBuilder(i)
      ];
    }
    const pageTitle = 'بدء تلاوة';
    return ScaffoldWidget(
      pageTitle: pageTitle,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("من سورة"),
                DropdownButton<int>(
                  value: startSora,
                  underline: Container(
                    height: 2,
                    color: Colors.brown,
                  ),
                  onChanged: (int? v) {
                    setState(() {
                      startSora = v!;
                    });
                  },
                  items: soratList,
                  alignment: AlignmentDirectional.centerEnd,
                ),
                const Text("الآية"),
                DropdownButton<int>(
                  value: startAya,
                  items: numOfAyatStart,
                  onChanged: (v) => setState(() {
                    startAya = v!;
                  }),
                ),
              ],
            ),
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("إلى سورة"),
                DropdownButton<int>(
                  value: endSora,
                  underline: Container(
                    height: 2,
                    color: Colors.brown,
                  ),
                  onChanged: (int? v) {
                    setState(() {
                      endSora = v!;
                    });
                  },
                  alignment: AlignmentDirectional.centerEnd,
                  items: soratList,
                ),
                const Text("الآية"),
                DropdownButton<int>(
                  value: endAya,
                  items: numOfAyatEnd,
                  onChanged: (v) => setState(() {
                    endAya = v!;
                  }),
                ),
              ],
            ),
            ButtonWidget(
              onPressed: () async {
                var data = await createTilawa();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Revision(
                        tilawa: data,
                      );
                    },
                  ),
                );
              },
              text: "بدء المراجعة",
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<int> numAyatItemBuilder(int value) {
    return DropdownMenuItem<int>(
      alignment: Alignment.centerRight,
      value: value,
      child: Text(
        value.toString().padLeft(3),
        textAlign: TextAlign.right,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}

import 'package:quran/quran.dart' as quran;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class file1 extends StatefulWidget {
  final int id;
  const file1({Key? key, required this.id}) : super(key: key);

  @override
  State<file1> createState() => _file1State();
}

class _file1State extends State<file1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Container(
            alignment: Alignment.center,
            child: Text(
              quran.getSurahNameArabic(widget.id),
              style: TextStyle(fontSize: 28),
            ),
          )),
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
                        Container(
                          alignment: Alignment.bottomCenter,
                          height: 70,
                          width: double.infinity,
                          child: Text(
                            quran.basmala,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'kitab'),
                          ),
                        ),
                        Container(
                          height: 600,
                          width: double.infinity,
                          child: SafeArea(
                            child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Container(
                                  height: 400,
                                  width: double.infinity,
                                  child: ListView.builder(
                                    itemCount: quran.getVerseCount(widget.id),
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text(
                                          quran.getVerse(
                                            widget.id,
                                            index + 1,
                                            verseEndSymbol: true,
                                          ),
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'kitab'),
                                        ),
                                      );
                                    },
                                  ),
                                )),
                          ),
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}

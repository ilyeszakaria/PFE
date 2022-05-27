import 'package:application3/mixins/chat.dart';
import 'package:application3/pages/start_revision.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ListeRevision extends StatefulWidget {
  const ListeRevision({Key? key}) : super(key: key);

  @override
  State<ListeRevision> createState() => _ListeRevisionState();
}

class _ListeRevisionState extends State<ListeRevision> with TilawaHeadersMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
            width: double.infinity,
            child: Text(
              " المراجعات",
            ),
            alignment: Alignment.center,
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return StartRevision();
          }));
        },
        label: Text(
          "بدء مراجعة",
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
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[
            Container(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 1,
                    vertical: 3,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 40),
                        alignment: Alignment.centerRight,
                        width: double.infinity,
                        height: 60,
                        child: CircularPercentIndicator(
                          radius: 30,
                          center: Text(
                            "35%",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          lineWidth: 10,
                          progressColor: Color.fromARGB(255, 148, 127, 119),
                          percent: 0.35,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            alignment: Alignment.centerRight,
                            child: Text(
                              ": قائمة المراجعات",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            height: 33,
                          )
                        ],
                      ),
                      tilawatListBuilder(),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

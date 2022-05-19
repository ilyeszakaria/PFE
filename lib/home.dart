import 'package:application3/Studentpage.dart';
import 'package:application3/TeacherPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class home extends StatefulWidget {
  final String username;
  const home({Key? key, required this.username}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Widget build(BuildContext context) {
    bool isActivateStudebt = true;
    bool isActivateTeacher = true;
    return Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment.center,
            child: Text(
              "الصفحة الرئيسية",
              style: TextStyle(fontFamily: 'Cairo'),
            ),
          ),
          backgroundColor: Colors.brown,
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                child: Text(
                  "ilyes مرحبا ",
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 30,
                      color: Color.fromARGB(255, 101, 74, 64),
                      fontWeight: FontWeight.bold),
                ),
                alignment: Alignment.center,
              ),
              Container(
                width: double.infinity,
                height: 250,
                alignment: Alignment.center,
                child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 300,
                    child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [BoxShadow(blurRadius: 5)],
                            borderRadius: BorderRadius.circular(20)),
                        height: 190,
                        width: 190,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "img/imageedit.jpg",
                            fit: BoxFit.fill,
                          ),
                        ))),
              ),
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 50),
                      height: 100,
                      width: 200,
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        onPressed: isActivateStudebt == true
                            ? () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return Studentpage(
                                    username: widget.username,
                                  );
                                }));
                              }
                            : null,
                        color: Color.fromARGB(255, 144, 108, 94),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            " تلميذ",
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                  Divider(
                    height: 50,
                    color: Colors.white,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 200,
                    child: RaisedButton(
                      onPressed: isActivateTeacher == true
                          ? () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return TeacherPage(username: widget.username);
                              }));
                            }
                          : null,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Color.fromARGB(255, 144, 108, 94),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "معلم",
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

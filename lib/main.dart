import 'package:application3/Conversations.dart';
import 'package:application3/ListeEleve.dart';
import 'package:application3/ListeMessageTilawa.dart';
import 'package:application3/ListeRevision.dart';
import 'package:application3/ListeTestStudent.dart';
import 'package:application3/ListeTestTeacher.dart';
import 'package:application3/Login.dart';
import 'package:application3/MessageTest.dart';
import 'package:application3/Messages.dart';
import 'package:application3/ProfilEleve.dart';
import 'package:application3/ReponceTest.dart';
import 'package:application3/Revision.dart';
import 'package:application3/SignIn.dart';
import 'package:application3/SignIn2.dart';
import 'package:application3/Studentpage.dart';
import 'package:application3/TeacherPage.dart';
import 'package:application3/Test.dart';
import 'package:application3/doaah.dart';
import 'package:application3/file1.dart';
import 'package:application3/file2.dart';
import 'package:application3/home.dart';
import 'package:application3/models/messageTilawaModel1.dart';
import 'package:application3/parametre.dart';
import 'package:application3/screens.dart/home.dart';
import 'package:application3/startRevision.dart';
import 'package:application3/test4.dart';
import 'package:application3/testt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:application3/doaah.dart';
import 'package:application3/screens.dart/home.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
        primaryColor: Colors.brown,
      ),
      
      home: Login()
    );
  }
}


    



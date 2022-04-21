import 'dart:convert';


import 'package:application3/file2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:http/http.dart' as http;



class file1 extends StatefulWidget {
  file1({Key? key}) : super(key: key);

  @override
  State<file1> createState() => _file1State();
}

class _file1State extends State<file1> {

  /*delete(String id){
    // ignore: non_constant_identifier_names
    var Responce=http.delete(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

    print(Responce)
  }*/
  
  getdata()async{
    final responce=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/"));
    final body=json.decode(responce.body);
    print(body);
  }

  

  String value="ilyes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextFormField(
              onChanged: (text){
               value=text;
              },
            
            ),
            TextFormField(
              onChanged: (text){
               value=text;
              },
            
            ),
            Divider(),
            GestureDetector(
             onTap: (){
               getdata;
             },
             child: Container(
               width: 100,
               height: 50,
               color: Colors.green,
             ),
            )
            
          ],
        ),
      ),
    );

  }
}
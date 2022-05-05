
import 'dart:convert';

import 'package:application3/ListeMessageTilawa.dart';
import 'package:application3/ListeTestTeacher.dart';
import 'package:application3/models/messageTilawaModel1.dart';
import 'package:application3/parametre.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 

class ListeEleveInvitation extends StatefulWidget {
  ListeEleveInvitation({Key? key}) : super(key: key);

  @override
  State<ListeEleveInvitation> createState() => _ListeEleveInvitationState();
}

class _ListeEleveInvitationState extends State<ListeEleveInvitation> {

  static Future<List<student>> getstudent(BuildContext context) async{
   final assetBundel = DefaultAssetBundle.of(context);
   final data= await assetBundel.loadString('assets/student.json');
   final body = json.decode(data);
   return body.map<student>(student.fromJson).toList();
  } 

  String accept="موافقة";

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar:   AppBar(
        title: Text("                          طلبات  ",style: TextStyle(fontFamily: 'Cairo'),),
        leading: IconButton(icon: Icon(Icons.arrow_back,),onPressed: (){
        Navigator.of(context).pop();
      },),
        elevation: 10,
        backgroundColor: Colors.brown[400]
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        height: double.infinity,
        width: double.infinity,
        child: FutureBuilder<List<student>>(
          future: getstudent(context),
          builder: (context,snapchot){
            final students=snapchot.data;
            return ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(color: Colors.white,height: 2,);
            },
            
            itemCount: students?.length ?? 0,
            itemBuilder :(context, index) {
              final student=students![index];
             return GestureDetector(
               onTap: () {
                
               },
                child: Container(
               child: Row(children: [
                   Container(
                     alignment: Alignment.center,
                     child: GestureDetector(
                       onTap: (){
                         setState(() {
                           print("accept");
                         });
                       },
                       child: Text(accept,style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold,color: Colors.brown),),
                     ),
                     width: 120,
                     height: 55,
                     
                   ),
                   Container(
                   alignment: Alignment.center,
                   height: 55,
                   width: 150,
                  
                   child: Text(student.username,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,fontFamily: 'Cairo'),),
                 ),
                 Container(
                   width: 80,
                   height: 55,
                   
                   child: CircleAvatar(child: Icon(Icons.person,color: Colors.black,),backgroundColor: Color.fromARGB(255, 219, 219, 219),),
                 ),
                 
                 
               ],
               mainAxisAlignment:MainAxisAlignment.end
               ),
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  boxShadow: [
                    BoxShadow(blurRadius: 1)
                  ],
                  borderRadius: BorderRadius.circular(3)
                ),
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                
             ),
             );
          },);
          },
          )
      ),

    );
  }
}
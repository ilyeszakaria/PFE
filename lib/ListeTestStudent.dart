import 'dart:convert';

import 'package:application3/ListeRevision.dart';
import 'package:application3/MessageTest.dart';
import 'package:application3/Test.dart';
import 'package:application3/models/messageTilawaModel1.dart';
import 'package:application3/parametre.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ListeTestStudent extends StatefulWidget {
  final String username;
  const ListeTestStudent({Key? key,required this.username}) : super(key: key);

  @override
  State<ListeTestStudent> createState() => _ListeTestStudentState();
}

class _ListeTestStudentState extends State<ListeTestStudent> {

  static Future<List<TestStudent>> getTestStudent(BuildContext context) async{
   final assetBundel = DefaultAssetBundle.of(context);
   final data= await assetBundel.loadString('assets/TestStudent.json');
   final body = json.decode(data);
   return body.map<TestStudent>(TestStudent.fromJson).toList();
 } 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        title: Text("                      اختبارات  ",style: TextStyle(fontFamily: 'Cairo'),),
             
        elevation: 10,
        backgroundColor: Colors.brown[400]
      ),
     

       body:AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal:1,
                vertical: 3
                
              ),
              child: Column(
        children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              
              height: 50,
              width: 210,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 17),
                    height: 5,
                    width: 5,
                   
                  ),
                  Divider(thickness: 1,color: Colors.black,),
                  Container(
                    height: 5,
                    width: 5,
                    
                  ),

                ]
                ),
            ),
            Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.topRight,
          child: Text(" : سجل الختبارات      ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),),
          height: 35,
          width: 180,
         
          
        )
          ],
        ),
          
           Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        height: 700,
        
        width: double.infinity,
        child:  FutureBuilder<List<TestStudent>>(
          future: getTestStudent(context),
          builder: (context,snapchot){
             final tests=snapchot.data;
             return ListView.builder(
            itemCount: tests?.length ?? 0,
            itemBuilder :(context, index) {
              final test=tests![index];
             return GestureDetector(
               onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context){return MessageTest(idtest:"",idstudent:"",username: widget.username,);} ));
               },
               child: Container(
               
               child: Row(children: [
                   Container(
                   
                   height: 80,
                   width: 100,
                   child: Text(test.date,style: TextStyle(fontFamily: 'Cairo',fontSize: 10),),
                   alignment: Alignment.center,
                 ),
                 Container(
                   margin: EdgeInsets.symmetric(horizontal: 5),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       
                       Container(
                         
                         child: Column(
                         children: [
                           Container(
                             alignment: Alignment.centerRight,
                             height:  40,
                             width: 250,
                             child:   Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 Text(test.AyaDebut,style:TextStyle(fontFamily: 'Cairo')),
                                 Text("   : اللاية رقم   ",style: TextStyle(fontSize:15,fontWeight: FontWeight.w500,fontFamily: 'Cairo')),
                                 Text(test.SouraDebut,style:TextStyle(fontFamily: 'Cairo')),
                                 Text("   : من سورة",style: TextStyle(fontSize:15,fontWeight: FontWeight.w500,fontFamily: 'Cairo'))
                                 
                               ],
                             ),
                             
                           ),
                           
                           Container(
                             alignment: Alignment.centerRight,
                             height: 40,
                             width: 250,
                             
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 Text(test.AyaFin,style:TextStyle(fontFamily: 'Cairo')),
                                 Text("   : اللاية رقم      ",style: TextStyle(fontSize:15,fontWeight: FontWeight.w500,fontFamily: 'Cairo')),
                                 Text(test.SouraFin,style:TextStyle(fontFamily: 'Cairo',fontSize: 10) ,),
                                 Text("  : الى سورة",style: TextStyle(fontSize:15,fontWeight: FontWeight.w500,fontFamily: 'Cairo'))
                                 
                               ],
                             ),
                           ),
                          
                         ],
                       ),
                       ),
                       VerticalDivider(color: Colors.grey,),
                         
                     ],
                   )
                 ),
                 
               ],
               mainAxisAlignment:MainAxisAlignment.end
               ),
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(blurRadius: 1)
                  ],
                  color: Colors.grey
                  ),
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
             ),
               
             );
          },);
          },
          )
      ),
        ],
      )
              
              
              
            )
          )
        ],
        ),
      ),

      


    );
  }
}
import 'dart:convert';

import 'package:application3/ListeTestStudent.dart';
import 'package:application3/Revision.dart';
import 'package:application3/models/messageTilawaModel1.dart';
import 'package:application3/parametre.dart';

import 'package:application3/startRevision.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class ListeRevision extends StatefulWidget {
  final String username;
  const ListeRevision({Key? key, required this.username}) : super(key: key);

  @override
  State<ListeRevision> createState() => _ListeRevisionState();
}

class _ListeRevisionState extends State<ListeRevision> {
  
  static Future<List<Tilawa>> getTilawa(BuildContext context) async{
   final assetBundel = DefaultAssetBundle.of(context);
   final data= await assetBundel.loadString('assets/Tilawa.json');
   final body = json.decode(data);
   return body.map<Tilawa>(Tilawa.fromJson).toList();
 } 





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        title: Container(width: double.infinity,child: Text(" المراجعات",style: TextStyle(fontFamily: 'Cairo'),),alignment: Alignment.center,),
        leading: IconButton(icon: Icon(Icons.arrow_back,),onPressed: (){
        Navigator.of(context).pop();
      },),
        elevation: 10,
        backgroundColor: Colors.brown[400]
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context){return startRevision();} ));
        }, label: Text("بدء مراجعة",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),),icon: Icon(Icons.add,size: 30,),backgroundColor: Colors.brown[400],),
         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
     
      body:  AnnotatedRegion<SystemUiOverlayStyle>(
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
              child: Column(children: [
               Container(
                 padding: EdgeInsets.only(right: 40),
                 alignment: Alignment.centerRight,
                 width: double.infinity,
                 height: 60,
                 
                 child: CircularPercentIndicator(
                  radius: 30,
                  center: Text("35%",style: TextStyle(fontFamily: 'Cairo',fontSize: 15,fontWeight: FontWeight.w600),),
                  lineWidth: 10,
                  progressColor: Color.fromARGB(255, 148, 127, 119),
                  percent: 0.35,
                  ),
               ),
               
        
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              
              height: 50,
              width: 200,
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
          alignment: Alignment.centerRight,
          child: Text(": قائمة المراجعات     ",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),),
          height: 33,
          
         
          
        )
          ],
        ),
        
        Container(
          
          height: 700,
          width: double.infinity,
          
          child: FutureBuilder<List<Tilawa>>(
            future: getTilawa(context),
            builder: (context,snopchat){
              final tilawas=snopchat.data;
              return ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(color: Colors.white,);
            },
            
            itemCount: tilawas?.length ?? 0,
            itemBuilder :(context, index) {
              final tilawa=tilawas![index];
             return GestureDetector(
               onTap: (){
                 
                 Navigator.of(context).push(MaterialPageRoute(builder: (context){return Revision(idtilawa: "",
                 AyaDebut:tilawa.AyaDebut,AyaFin:tilawa.AyaFin,SouraDebut:tilawa.SouraDebut,SouraFin:tilawa.SouraFin,username:widget.username);} ));
               },
               child: Container(
               child: Row(children: [
                 Container(
                   width: 58,
                   height: 100,
                   child: GestureDetector(
                     child: Icon(Icons.delete),
                     onTap: (){
                       print("supprimer");
                     },
                   )
                   
                 ),
                 Container(
                   
                   height: 100,
                   
                   child: Column(children: [
                     Container(
                       alignment: Alignment.centerRight,
                       
                       margin: EdgeInsets.only(right: 0),
                       height: 20,
                       child: Text(tilawa.date,style: TextStyle(fontFamily: 'Cairo'),),
                     ),
                     Container(
                       height: 40,
                       
                       
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           Container(
                             child: Text(tilawa.AyaDebut),
                             alignment: Alignment.center,
                             width: 70,
                           ),
                            Container(
                             child: Text(":  الاية  رقم",style: TextStyle(fontFamily: 'Cairo'),),
                             alignment: Alignment.center,
                             width: 70,
                           ),
                            Container(
                             child: Text(tilawa.SouraDebut),
                             alignment: Alignment.center,
                             width: 70,
                           ),
                            Container(
                             child: Text("  : من سورة    ",style: TextStyle(fontFamily: 'Cairo'),),
                             alignment: Alignment.center,
                             width: 100,
                           )
                         ],
                       ),
                     ),
                     Container(
                       height: 40,
                       
                       
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           Container(
                             child: Text(tilawa.AyaFin),
                             alignment: Alignment.center,
                             width: 70,
                           ),
                            Container(
                             child: Text(":  الاية  رقم",style: TextStyle(fontFamily: 'Cairo'),),
                             alignment: Alignment.center,
                             width: 70,
                           ),
                            Container(
                             child: Text(tilawa.SouraFin),
                             alignment: Alignment.center,
                             width: 70,
                           ),
                            Container(
                             child: Text("  : الى سورة",style: TextStyle(fontFamily: 'Cairo'),),
                             alignment: Alignment.center,
                             width: 100,
                             
                           )
                         ],
                       ),
                       
                     )
                   ]),
                 ),
                 
               ],
               mainAxisAlignment:MainAxisAlignment.end
               ),
                height: 100,
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
          
        
        
        
              ]),
              
              
              
            )
          )
        ],
        ),
      ),
    );;
  }
}
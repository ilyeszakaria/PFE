import 'dart:convert';
import 'package:application3/models/messageTilawaModel1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Revision extends StatefulWidget {
  final String idtilawa;
  final String AyaDebut;
  final String AyaFin;
  final String SouraDebut;
  final String SouraFin;
  final String username;
  const Revision({Key? key,required this.idtilawa, required this.AyaDebut, required this.AyaFin, required this.SouraDebut, required this.SouraFin,required this.username}) : super(key: key);

  @override
  State<Revision> createState() => _RevisionState();
}

class _RevisionState extends State<Revision> {

  static Future<List<MessageTilawa>> getmessageTilawa(BuildContext context) async{
   final assetBundel = DefaultAssetBundle.of(context);
   final data= await assetBundel.loadString('assets/MessageTilawa.json');
   final body = json.decode(data);
   return body.map<MessageTilawa>(MessageTilawa.fromJson).toList();
  } 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:   AppBar(
        title: Row(
          children: [
             VerticalDivider(width: 45,),
             Text(widget.AyaFin,style: TextStyle(fontFamily: 'Cairo'),),
             VerticalDivider(),
              Text(widget.SouraFin,style: TextStyle(fontFamily: 'Cairo'),),
              VerticalDivider(width: 30,),
               Text("الى",style: TextStyle(fontFamily: 'Cairo'),),
               VerticalDivider(width: 25,),
               Text(widget.AyaDebut,style: TextStyle(fontFamily: 'Cairo'),),
               VerticalDivider(),
                Text(widget.SouraDebut,style: TextStyle(fontFamily: 'Cairo'),),
                Text("من",style: TextStyle(fontFamily: 'Cairo'),),
          ],
        ),
             
        elevation: 10,
        backgroundColor: Colors.brown[400]
      ),
     
      body: Stack(
        children: <Widget>[
          
          Container(
            width: double.infinity,
            
            height: 600,
            child: FutureBuilder<List<MessageTilawa>>(
            future: getmessageTilawa(context),
            builder: (context,snapchot){
              final messagesTilawa=snapchot.data;
              return ListView.builder(
  itemCount: messagesTilawa?.length ??  0,
  shrinkWrap: true,
  padding: EdgeInsets.only(top: 10,bottom: 10),

  itemBuilder: (context, index){
    final messageTilawa=messagesTilawa![index];
    return Container(
      padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
      child: Align(
        alignment: (messageTilawa.sender != widget.username?Alignment.topLeft:Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (messageTilawa.sender  != widget.username?Colors.grey.shade200:Colors.brown[200]),
          ),
          padding: EdgeInsets.all(16),
          child: Text(messageTilawa.audio ,style: TextStyle(fontSize: 15),),
        ),
      ),
    );
  },
);
            },
          ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 150,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.mic, color: Colors.white, size: 50, ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
      
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){},
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Colors.brown,
                    elevation: 0,
                  ),
                    ],
                  )
                ],
                
              ),
            ),
            
          ),
        ],
      ),
    );
  }
}
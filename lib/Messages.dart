import 'dart:convert';


import 'package:application3/models/messageTilawaModel1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Messages extends StatefulWidget {
  final String username;
  const Messages({Key? key, required this.username}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {

  static Future<List<Message>> getmessage(BuildContext context) async{
   final assetBundel = DefaultAssetBundle.of(context);
   final data= await assetBundel.loadString('assets/message.json');
   final body = json.decode(data);
   return body.map<Message>(Message.fromJson).toList();
  } 



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,),onPressed: (){
        Navigator.of(context).pop();
      },),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back,color: Colors.black,),
                ),
                SizedBox(width: 2,),
                
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.username,style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600,fontFamily: 'Cairo'),),
                      SizedBox(height: 6,),
                      
                    ],
                  ),
                ),
                VerticalDivider(color: Colors.white,),
                CircleAvatar(
                  child:Icon(Icons.person),
                  backgroundColor: Colors.brown,
                  maxRadius: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          FutureBuilder(
            future: getmessage(context),
            builder:(context,AsyncSnapshot<List<Message>> snapchot){
              final messages=snapchot.data;
              return ListView.builder(
  itemCount: messages?.length ?? 0,
  shrinkWrap: true,
  padding: EdgeInsets.only(top: 10,bottom: 10),
 
  itemBuilder: (context, index){
    final message=messages![index];
    return Container(
      padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
      child: Align(
        alignment: (messages[index].sender != widget.username?Alignment.topLeft:Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (messages[index].sender != widget.username?Colors.grey.shade200:Color.fromARGB(255, 128, 100, 90)),
          ),
          padding: EdgeInsets.all(16),
          child: Text(messages[index].text, style: TextStyle(fontSize: 15,fontFamily: 'Cairo'),),
        ),
      ),
    );
  },
);
            }
            ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.mic, color: Colors.white, size: 20, ),
                    ),
                  ),
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
                
              ),
            ),
            
          ),
        ],
      ),
    );
  }
}
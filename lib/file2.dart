import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class file2 extends StatefulWidget {

  final String value;
  const file2({Key? key, required this.value}) : super(key: key);
  
 

  
  @override
  State<file2> createState() => _file2State();
}

class _file2State extends State<file2> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        
         child:Text(widget.value)
      ),
    );
  }
}
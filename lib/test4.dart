import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class test4 extends StatefulWidget {
  test4({Key? key}) : super(key: key);

  @override
  State<test4> createState() => _test4State();
}

class _test4State extends State<test4> {
  var postJsont=[];

  PostData() async{
    try{

      var resource=await http.post(Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    body: {
      "userId": "1",
    "id": "101",
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
    }
    );
    print(resource.body);

    }catch(e){
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: RaisedButton(onPressed: (() {
          PostData();
        })),
      ),
    );
  }
}
import 'package:application3/SignIn.dart';
import 'package:application3/Studentpage.dart';
import 'package:application3/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool isActivateStudebt=true;
  bool isActivateTeacher=true;
  String username="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:   AppBar(
        title: Text("                              تسجيل الدخول  ",style: TextStyle(fontFamily: 'Cairo'),),
             
        elevation: 10,
        backgroundColor: Color.fromARGB(255, 107, 75, 64)
      ),
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
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 300,
                   
                    child: Container(
                      decoration: BoxDecoration(
                      boxShadow: [
                    BoxShadow(blurRadius: 5)
                  ],
                      borderRadius: BorderRadius.circular(20)
                    ),
                      height: 160,
                      width: 160,
                      child:ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child:  Image.asset("img/imageedit_13_3019360319.jpg",fit: BoxFit.fill,),
                        )
                    )
                  
                  ),
                   Column(
                children: [
                  Container(
                    
                    margin: EdgeInsets.only(right: 30),
                    alignment: Alignment.centerRight,
                    child: Text("اسم المستخدم",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right:20,left: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 101, 74, 64),width: 5)
                      
                    ),
                    height: 60,
                    width: double.infinity,
                    child:  TextFormField(
                      
                      textAlign: TextAlign.end,
                       onChanged: (text){
                         username=text;
                       },
                
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                cursorColor: Color.fromARGB(255, 101, 74, 64),
                
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   
                   

                   
                 ),),
                  ),
                  Divider(color: Colors.white,),
                  Column(
                children: [
                  Container(
                    
                    margin: EdgeInsets.only(right: 30),
                    alignment: Alignment.centerRight,
                    child: Text("كلمة السر",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right:20,left: 20),
                    decoration: BoxDecoration(
                      
                      border: Border.all(color: Color.fromARGB(255, 101, 74, 64),width: 5)
                    ),
                    height: 60,
                    width: double.infinity,
                    child:  TextFormField(
                      textAlign: TextAlign.end,
                      obscureText: true,
                
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                cursorColor: Color.fromARGB(255, 101, 74, 64),
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   

                   
                 ),),
                  ),
                 GestureDetector(
                   child:  Container(
                    child: Text("هل نسيت كلمة السر ",style: TextStyle(fontFamily: 'Cairo'),),
                    margin: EdgeInsets.only(right: 230),
                  ),
                  onTap: (){
                    print("object");
                  },
                 )
                ],
                
              ),
                ],
                
              ),
              Divider(color: Colors.white,height: 40,),
              Container(
                  margin:EdgeInsets.only(right: 5),
                  child:FlatButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){return home(username:username);} ));
                },
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 130),
                child: Text("تسجيل الدخول",style:TextStyle(fontSize: 15,fontFamily: 'Cairo'),),
                color: Color.fromARGB(255, 101, 74, 64),
                
                
                )
                ),
                GestureDetector(
                  child: Container(
                  margin: EdgeInsets.only(top:20),
                  child: Text("انشاء حساب" ,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Cairo'),),
                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){return SignIn();} ));
                },
                )
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
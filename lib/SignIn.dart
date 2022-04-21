import 'package:application3/Login.dart';
import 'package:application3/SignIn2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
   DateTime time=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        title: Text("                   انشاء حساب  ",style: TextStyle(fontFamily: 'Cairo'),),
             
        elevation: 10,
        backgroundColor: Colors.brown[400]
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
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
              margin: EdgeInsets.only(bottom: 5,top: 10),
              child: Column(
                children: [
                  Container(
                   
                    margin: EdgeInsets.only(right: 30),
                    alignment: Alignment.centerRight,
                    child: Text("اسم العائلة",style: TextStyle(fontSize: 15,fontFamily: 'Cairo'),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right:20,left: 20),
                    decoration: BoxDecoration(
                      
                      border: Border.all(color: Colors.brown,width: 4)
                    ),
                    height: 45,
                    width: double.infinity,
                    child:  TextFormField(
                    textAlign: TextAlign.end,
                
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),
                cursorColor: Colors.brown,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   

                   
                 ),),
                  )
                ],
              ),
              height:80,
              width: 170,
              
            ),
                Container(
              margin: EdgeInsets.only(top:10,bottom: 5),
              child: Column(
                children: [
                  Container(
                    
                    margin: EdgeInsets.only(right: 30),
                    alignment: Alignment.centerRight,
                    child: Text(" الاسم الاول  ",style: TextStyle(fontSize: 15,fontFamily: 'Cairo'),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right:20,left: 20),
                    decoration: BoxDecoration(
                     
                      border: Border.all(color: Colors.brown,width: 4)
                    ),
                    height:45,
                    width: double.infinity,
                    child: TextFormField(
                      textAlign: TextAlign.end,

                
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),
                cursorColor: Colors.brown,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   

                   
                 ),),
                  )
                ],
              ),
              height: 80,
              width: 210,
              
            ),
            
              ],
            ),
             Container(
               
               
          margin: EdgeInsets.only(bottom: 5),
          alignment: Alignment.centerRight,
          child:Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 23),
                
                width: double.infinity,
                child: Text("تاريخ الميلاد",style: TextStyle(fontSize: 15,fontFamily: 'Cairo'),),
              ),
               Container(
            margin: EdgeInsets.only(right:20,left: 180),
            height: 45,
            width: 200,
            
            decoration: BoxDecoration(
              
              border: Border.all(color: Colors.brown,width: 4)
            ),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              
                  IconButton(onPressed: () async{
                     DateTime? datetime =await showDatePicker(
                       context: context,
                        initialDate: time,
                         firstDate: time,
                          lastDate: DateTime(2100)
                          ) ;
                          setState(() {
                            time=datetime!;
                          });
                  }, icon: Icon(Icons.calendar_month,color: Colors.brown,)),
                  VerticalDivider(width: 50,),
                 Container(
                   alignment: Alignment.center,
                   height: 35,
                   width: 80,
                   child:  Text(
                     '${time.year}/${time.month}/${time.day}',style: TextStyle(fontFamily: 'Cairo'),
                   ),
                  
                 ),
                 
              
            ],
          ),
          ),
            ],
          ),
          height: 80,
          
          width: double.infinity,
          
        ),
        Container(
              margin: EdgeInsets.only(bottom: 5,left: 120),
              child: Column(
                children: [
                  Container(
                    
                    margin: EdgeInsets.only(right: 30),
                    alignment: Alignment.centerRight,
                    child: Text("اسم المستخدم",style: TextStyle(fontSize: 15,fontFamily: 'Cairo'),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right:20,left: 20),
                    decoration: BoxDecoration(
                      
                      border: Border.all(color: Colors.brown,width: 5)
                    ),
                    height: 45,
                    width: double.infinity,
                    child:  TextFormField(
                      textAlign: TextAlign.end,

                
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),
                cursorColor: Colors.brown,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   

                   
                 ),),
                  )
                ],
              ),
              height: 80,
              width: 300,
              
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5,left: 65),
              child: Column(
                children: [
                  Container(
                    
                    margin: EdgeInsets.only(right: 30),
                    alignment: Alignment.centerRight,
                    child: Text("البريد الالكتروني",style: TextStyle(fontSize: 15,fontFamily: 'Cairo'),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right:20,left: 20),
                    decoration: BoxDecoration(
                      
                      border: Border.all(color: Colors.brown,width: 4)
                    ),
                    height: 45,
                    width: double.infinity,
                    child:  TextFormField(
                      textAlign: TextAlign.end,

                
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),
                cursorColor: Colors.brown,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   

                   
                 ),),
                  )
                ],
              ),
              height: 80,
              width: 350,
              
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5,left: 120),
              child: Column(
                children: [
                  Container(
                    
                    margin: EdgeInsets.only(right: 30),
                    alignment: Alignment.centerRight,
                    child: Text("كلمة السر ",style: TextStyle(fontSize: 15,fontFamily: 'Cairo'),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right:20,left: 20),
                    decoration: BoxDecoration(
                      
                      border: Border.all(color: Colors.brown,width: 4)
                    ),
                    height: 45,
                    width: double.infinity,
                    child:  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    textAlign: TextAlign.end,
                
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),
                cursorColor: Colors.brown,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   

                   
                 ),),
                  )
                ],
              ),
              height: 80,
    
              width: 300,
              
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5,left: 120),
              child: Column(
                children: [
                  Container(
                    
                    margin: EdgeInsets.only(right: 30),
                    alignment: Alignment.centerRight,
                    child: Text("اعادة كلمة السر",style: TextStyle(fontSize: 15,fontFamily: 'Cairo'),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right:20,left: 20),
                    decoration: BoxDecoration(
                      
                      border: Border.all(color: Colors.brown,width: 4)
                    ),
                    height: 45,
                    width: double.infinity,
                    child: TextFormField(
                      textAlign: TextAlign.end,
                    keyboardType: TextInputType.visiblePassword,
                    
                
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),
                cursorColor: Colors.brown,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   

                   
                 ),),
                  )
                ],
              ),
              height: 80,
    
              width: 300,
              
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5,left: 220),
              child: Column(
                children: [
                  Container(
                    
                    margin: EdgeInsets.only(right: 30),
                    alignment: Alignment.centerRight,
                    child: Text("رقم الهاتف",style: TextStyle(fontSize: 15,fontFamily: 'Cairo'),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right:20,left: 20),
                    decoration: BoxDecoration(
                      
                      border: Border.all(color: Colors.brown,width: 4)
                    ),
                    height: 45,
                    width: double.infinity,
                    child: TextFormField(
                      textAlign: TextAlign.end,
                    keyboardType: TextInputType.number,
                    
                
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),
                cursorColor: Colors.brown,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   

                   
                 ),),
                  )
                ],
              ),
              height: 80,
    
              width: 200,
            
            ),
            Divider(color: Colors.white,),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin:EdgeInsets.only(right: 10),
                  child:FlatButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){return SignIn2();} ));
                },
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                child: Text("مواصلة",style:TextStyle(fontSize: 15,fontFamily: 'Cairo'),),
                color: Color.fromARGB(255, 149, 109, 94),
                
                
                )
                ),
               Container(
                 child:  FlatButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){return Login();} ));
                },
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 35),
                child: Text("الغاء",style:TextStyle(fontSize: 15,fontFamily: 'Cairo'),),
                color: Color.fromARGB(255, 149, 109, 94),
                
                ),
                margin: EdgeInsets.only(right: 10),
               ),
                
              ],
            ),
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
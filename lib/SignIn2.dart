import 'package:application3/SignIn.dart';
import 'package:application3/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SignIn2 extends StatefulWidget {
  SignIn2({Key? key}) : super(key: key);

  @override
  State<SignIn2> createState() => _SignIn2State();
}

class _SignIn2State extends State<SignIn2> {
  String dropdownValue1 = 'الفاتحة';
  String dropdownValue2 = 'الفاتحة';
  var flag=true;
  var sex;
  bool x1=false;
  bool x2=false;
  String genre="ذكر";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:   AppBar(
        title: Text("                           انشاء حساب  ",style: TextStyle(fontFamily: 'Cairo'),),
             
        elevation: 10,
        backgroundColor: Colors.brown[400]
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
                    margin: EdgeInsets.only(top: 20),
                    height: 170,
                    width: double.infinity,
                    
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 50,
                         
                          alignment: Alignment.centerRight,
                          child: Text("الصنف",style: TextStyle(fontSize: 23,fontFamily: 'Cairo',fontWeight: FontWeight.bold),),
                          margin: EdgeInsets.only(right: 30),
                        ),
                        Container(
                          margin: EdgeInsets.only(left:290),
                          height: 50,
                          width: double.infinity,
                          
                          child: Row(
               children: <Widget>[
                 Text("الذكر",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,fontFamily: 'Cairo'),),
                 Radio(
                   value:1,
                   onChanged: (v){// احصل على قيمة زر الاختيار من خلال حدث التغيير
                     setState(() {
                        this.sex=v;
                     });
                   },
                   groupValue:this.sex ,// قيمة زر الراديو
                 ),
                 SizedBox(width: 20),
                 
               ],
             ),
                        ),
                        Container(
                          
                          margin: EdgeInsets.only(left:295),
                          alignment: Alignment.centerRight,
                          child: Row(
                            children: [
                              Text("أنثى",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,fontFamily: 'Cairo'),),
                              VerticalDivider(),
                              
                 Radio(
                   value:2,
                   onChanged: (v){
                     setState(() {
                        this.sex=v;
                     });
                   },
                   groupValue:this.sex ,
                 )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 160,
                    width: double.infinity,
                    
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 50,
                          
                          alignment: Alignment.centerRight,
                          child: Text("  نوع المستخدم",style: TextStyle(fontSize: 23,fontFamily: 'Cairo',fontWeight: FontWeight.bold),),
                          margin: EdgeInsets.only(right: 14),
                        ),
                        Container(
                          
                          alignment: Alignment.centerRight,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 300),
                                child: Row(
                          
                        children: [
                          Text("معلم",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,fontFamily: 'Cairo')),
                          Checkbox(value: x1, onChanged: (val){
                            setState(() {
                              x1=val!;
                            });
                          },),
                        ],
                      ),
                               
                              ),
                      VerticalDivider(),
                      Container(
                        margin: EdgeInsets.only(left: 290),
                        child: Row(
                          children: [
                            Text(" تلميذ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,fontFamily: 'Cairo')),
                          Checkbox(value: x2, onChanged: (val){
                            setState(() {
                              x2=val!;
                            });
                          },),
                          
                        ],

                      ),
                      )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    
                    width: double.infinity,
                    height: 280,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 40,
                          
                          alignment: Alignment.centerRight,
                          child: Text("كم تحفظ من القران الكريم  ",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),),
                          margin: EdgeInsets.only(right: 12),
                        ),
                        Container(
                          width: double.infinity,
                          height: 120,
                         
                          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 40,
                
                 child: TextFormField(
                   textAlign: TextAlign.end,

                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),
                cursorColor: Colors.brown,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   

                   
                 ),),
                width: 50,
                decoration: BoxDecoration(
                  
                  border: Border.all(width: 5,color: Colors.brown)
                ),
              ),
              Text("  : الاية رقم   ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,fontFamily: 'Cairo'),),
              VerticalDivider(color: Colors.white,),
              Container(
                alignment: Alignment.center,
                height: 40,
                
                width: 90,
                decoration: BoxDecoration(
                  
                  border: Border.all(width: 5,color: Colors.brown)
                ),
                child: DropdownButton<String>(
      value: dropdownValue1,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
     
      underline: Container(
        height: 2,
        
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue1 = newValue!;
        });
      },
      items: <String>['مريم', 'النساء', 'ال عمران', 'البقرة', 'الفاتحة']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,style: TextStyle(fontFamily: 'Cairo'),),
        );
      }).toList(),
    )
              ),
              VerticalDivider(color: Colors.white,),
              Text("من سورة    ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,fontFamily: 'Cairo'),),
             
              
            ],
          ),
                        ),
                        Container(
                          
                          width: double.infinity,
                          height: 120,
                          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 40,
                
                 child: TextFormField(
                   textAlign: TextAlign.end,

                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),
                cursorColor: Colors.brown,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   

                   
                 ),),
                width: 50,
                decoration: BoxDecoration(
                  
                  border: Border.all(width: 5,color: Colors.brown)
                ),
              ),
              Text(" : الاية رقم   ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,fontFamily: 'Cairo'),),
              VerticalDivider(color: Colors.white,),
              Container(
                alignment: Alignment.center,
                height: 40,
                
                width: 90,
                decoration: BoxDecoration(
                  
                  border: Border.all(width: 5,color: Colors.brown)
                ),
                child:DropdownButton<String>(
      value: dropdownValue2,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
     
      underline: Container(
        height: 2,
        
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue2 = newValue!;
        });
      },
      items: <String>['مريم', 'النساء', 'ال عمران', 'البقرة', 'الفاتحة']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,style: TextStyle(fontFamily: 'Cairo'),),
        );
      }).toList(),
    )
              ),
              VerticalDivider(color: Colors.white,),
              Text("الى سورة   ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,fontFamily: 'Cairo'),)
              
            ],
          ),
          
                        ),
                        
                      ],
                    ),
                  ),
                  Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin:EdgeInsets.only(right: 10),
                  child:FlatButton(onPressed: (){
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context){return home();} ));
                },
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                child: Text("مواصلة",style:TextStyle(fontSize: 15,fontFamily: 'Cairo'),),
                color: Color.fromARGB(255, 149, 109, 94),
                
                
                )
                ),
               Container(
                 child:  FlatButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){return SignIn();} ));
                },
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 35),
                child: Text("عودة",style:TextStyle(fontSize: 15,fontFamily: 'Cairo'),),
                color: Color.fromARGB(255, 149, 109, 94),
                
                ),
                margin: EdgeInsets.only(right: 10),
               ),
                
              ],
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
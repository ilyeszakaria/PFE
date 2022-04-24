import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class parametre extends StatefulWidget {
  final String username;
  parametre({Key? key, required this.username}) : super(key: key);

  @override
  State<parametre> createState() => _parametreState();
}

class _parametreState extends State<parametre> {

  File? image;
  Future getimagegalery()async{
    final image= await ImagePicker().pickImage(source:ImageSource.gallery);
    if(image==null)return;
    final ImageTomp=File(image.path);
    setState(() {
      this.image=ImageTomp;
    }); 
  }
  Future getimagecamera()async{
    final image= await ImagePicker().pickImage(source:ImageSource.camera);
    if(image==null)return;
    final ImageTomp=File(image.path);
    setState(() {
      this.image=ImageTomp;
    }); 
  }
  

  
  DateTime time=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:   AppBar(
        title: Text("                 اعدادات الحساب   ",style: TextStyle(fontFamily: 'Cairo'),),
             
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
                    height: 100,
                    alignment: Alignment.centerRight,
                    width: double.infinity,
                    child: GestureDetector(
                      onLongPress: () {
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                        title: Text("تغيير صورة الحساب الشخصي",style: TextStyle(fontFamily: 'Cairo'),),
                        content: Container(
                          width: double.infinity,
                          height: 100,
                          child: Column(
                          children: [
                            Divider(thickness: 2,),
                            Container(
                          height: 70,
                          
                          width: double.infinity,
                          child: Row(
                          children: [
                           GestureDetector(
                             onTap: (){
                               getimagegalery();
                             },
                             child: Row(
                              children: [
                                Text("    اختيار صورة",style: TextStyle(fontFamily: 'Cairo')),
                                Icon(Icons.photo_album)
                              ],
                            ),
                             
                           ),
                            VerticalDivider(thickness: 2,),
                            Container(
                              child: GestureDetector(
                                onTap: (){
                                  getimagecamera();

                                },
                                child: Row(
                              children: [
                                Text("التقاط صورة",style: TextStyle(fontFamily: 'Cairo')) ,
                                Icon(Icons.photo_camera)
                              ],
                            )  ,
                              ),
                            )                 
                          ],
                        ),
                        )
                            
                          ],
                        ),
                        )
                      );
                        });
                      },
                    child:Container(
                      padding: EdgeInsets.only(right: 20),
                      child: CircleAvatar(backgroundColor: Colors.grey,radius: 50,
                      child: image != null ? ClipRRect(
                        borderRadius: BorderRadius.circular(70),
                        child: Image.file(image!,height: 100,width: 100,fit: BoxFit.cover,),
                      ):Icon(Icons.person,size: 80,color: Colors.black,),
                      ),
                    )
                  ),),
                   Container(
                     height: 406,
                     width: double.infinity,
                     
                     child: Column(
                      children: [
                        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              
              height: 50,
              width: 150,
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
          margin: EdgeInsets.only(right: 20),
          
          alignment: Alignment.center,
          child: Text("  : معلومات الحساب      ",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),),
          height: 37,
         
         
          
        )
          ],
        ),
                        Container(
                    
                    margin: EdgeInsets.only(right: 30),
                    alignment: Alignment.centerRight,
                    child: Text(" الاسم الاول  ",style: TextStyle(fontSize: 18,fontFamily: 'Cairo'),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right:22,left:  170),
                    decoration: BoxDecoration(
                     
                      border: Border.all(color: Colors.brown,width: 4)
                    ),
                    height:50,
                    width: 200,
                    
                    child: TextFormField(
                        initialValue: "baghdal",
                          textAlign: TextAlign.end,
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),
                cursorColor: Colors.brown,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   
                 ),),
                  ),
                   Container(
                    
                    margin: EdgeInsets.only(right: 30,top: 10),
                    alignment: Alignment.centerRight,
                    child: Text("اسم العائلة ",style: TextStyle(fontSize: 18,fontFamily: 'Cairo'),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right:20,left:  170),
                    decoration: BoxDecoration(
                     
                      border: Border.all(color: Colors.brown,width: 4)
                    ),
                    height:45,
                    width: 200,
                    
                    child: TextFormField(
                      initialValue: "baghdali",
                      textAlign: TextAlign.end,
                
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),
                cursorColor: Colors.brown,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   
                 ),),
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
                child: Text("تاريخ الميلاد",style: TextStyle(fontSize: 18,fontFamily: 'Cairo'),),
              ),
               Container(
            margin: EdgeInsets.only(right:20,left: 180),
            height: 43,
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
                  VerticalDivider(width: 40,color: Colors.white,),
                 Container(
                   alignment: Alignment.center,
                   height: 35,
                   
                   child:  Text(
                     '${time.year}/${time.month}/${time.day}    '
                   ,style: TextStyle(fontFamily: 'Cairo',fontSize: 15,fontWeight: FontWeight.bold),),
                  
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
                    
                    margin: EdgeInsets.only(right: 30,top: 5),
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 34,
                      
                      width: 200,
                      alignment: Alignment.topRight,
                      child: Text("اسم المستخدم",style: TextStyle(fontSize: 18,fontFamily: 'Cairo'),),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right:20,left:  170),
                    decoration: BoxDecoration(
                     
                      border: Border.all(color: Colors.brown,width: 4)
                    ),
                    height:45,
                    width: 200,
                    
                    child: TextFormField(
                      initialValue: widget.username,
                      textAlign: TextAlign.end,
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),
                cursorColor: Colors.brown,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   
                 ),),
                  ),
                        
                      ],
                     ),
                   ),
                   Container(
                     height: 450,
                     width: double.infinity,
                     
                     child: Column(
                      children: [
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
          margin: EdgeInsets.only(right: 10),
          
          alignment: Alignment.center,
          child: Text(" : الامان      ",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),),
          height: 37,
          
         
          
        )
          ],
        ),
                        Container(
                    
                    margin: EdgeInsets.only(right: 30),
                    alignment: Alignment.centerRight,
                    child: Text("البريد الالكتروني  ",style: TextStyle(fontSize: 18,fontFamily: 'Cairo'),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right:20,left:  80),
                    decoration: BoxDecoration(
                     
                      border: Border.all(color: Colors.brown,width: 4)
                    ),
                    height:60,
                    width: 300,
                    
                    child: TextFormField(
                      initialValue: "baghdaliilyeszakaria@gmail.com",
                       textAlign: TextAlign.end,
                
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),
                cursorColor: Colors.brown,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   
                 ),),
                  ),
                   Container(
                    
                    margin: EdgeInsets.only(right: 30,top: 5),
                    alignment: Alignment.centerRight,
                    child: Text("رقم الهاتف   ",style: TextStyle(fontSize: 18,fontFamily: 'Cairo'),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right:20,left:  220),
                    decoration: BoxDecoration(
                     
                      border: Border.all(color: Colors.brown,width: 4)
                    ),
                    height:45,
                    width: 150,
                    
                    child: TextFormField(
                      initialValue: "0657900538",
                      textAlign: TextAlign.end,

                
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),
                cursorColor: Colors.brown,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   
                 ),),
                  ),
                   
                 Container(
                    
                    margin: EdgeInsets.only(right: 30,top: 5),
                    alignment: Alignment.centerRight,
                    child: Text("كلمة السر ",style: TextStyle(fontSize: 18,fontFamily: 'Cairo'),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right:20,left:  170),
                    decoration: BoxDecoration(
                     
                      border: Border.all(color: Colors.brown,width: 4)
                    ),
                    height:45,
                    width: 200,
                    
                    child: TextFormField(
                      textAlign: TextAlign.end,
                      obscureText: true,
                
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                cursorColor: Colors.brown,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   
                 ),),
                  ),
        Container(
                    
                    margin: EdgeInsets.only(right: 30,top: 5),
                    alignment: Alignment.centerRight,
                     child: Text("اعادة كلمة السر",style: TextStyle(fontSize: 18,fontFamily: 'Cairo'),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right:20,left:  170),
                    decoration: BoxDecoration(
                     
                      border: Border.all(color: Colors.brown,width: 4)
                    ),
                    height:45,
                    width: 200,
                    
                    child: TextFormField(
                      
                      textAlign: TextAlign.end,
                      obscureText: true,
                
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                cursorColor: Colors.brown,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   
                 ),),
                  ),
                        
                      ],
                     ),
                   ),
                   Divider(color: Colors.white,),
            Container(
              margin: EdgeInsets.only(right: 10,bottom: 30),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin:EdgeInsets.only(right: 10),
                  child:FlatButton(onPressed: (){
                  print("object");
                },
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                child: Text("حفظ",style:TextStyle(fontSize: 15,fontFamily: 'Cairo'),),
                color: Color.fromARGB(255, 149, 109, 94),
                
                
                )
                ),
               Container(
                 child:  FlatButton(onPressed: (){
                  print("object");
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
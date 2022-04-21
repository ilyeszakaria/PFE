import 'dart:convert';

import 'package:application3/models/messageTilawaModel1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Test extends StatefulWidget {
  Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {

  static Future<List<student>> getstudent(BuildContext context) async{
   final assetBundel = DefaultAssetBundle.of(context);
   final data= await assetBundel.loadString('assets/student.json');
   final body = json.decode(data);
   return body.map<student>(student.fromJson).toList();
  } 

  

 
  List<String> Soura=['الكهف','مريم', 'النساء', 'ال عمران', 'البقرة', 'الفاتحة'];
 




  DateTime time=DateTime.now();
  TimeOfDay time2=TimeOfDay.now();
  
  String dropdownValue1 = 'الفاتحة';
  String dropdownValue2 = 'الفاتحة';

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        title: Text("                         اختبار  ",style: TextStyle(fontFamily: 'Cairo'),),
             
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
              child: Column(children: [
               
        Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              width: double.infinity,
              height: 60,
              
              child: Text(": بدا اختبار  ",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),),
            )
          ],
        ),
        Divider(height: 5,thickness: 1,color: Colors.black,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 45,
                
                 child: TextFormField(
                  textAlign: TextAlign.end,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),
                cursorColor: Colors.brown,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   

                   
                 ),),
                width: 50,
                decoration: BoxDecoration(
                  
                  border: Border.all(width: 3,color: Colors.brown)
                ),
              ),
              Text("  : الاية رقم   ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,fontFamily: 'Cairo'),),
              VerticalDivider(color: Colors.white,),
              Container(
                alignment: Alignment.center,
                height: 45,
                
                width: 90,
                decoration: BoxDecoration(
                  
                  border: Border.all(width: 3,color: Colors.brown)
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
      items:Souar().listSouar
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
          height: 65,
          
          width: double.infinity,
          
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 45,
                
                 child: TextFormField(
                   textAlign: TextAlign.end,
                   

                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),
                cursorColor: Colors.brown,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   

                   
                 ),),
                width: 50,
                decoration: BoxDecoration(
                  
                  border: Border.all(width: 3,color: Colors.brown)
                ),
              ),
              Text(" : الاية رقم   ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,fontFamily: 'Cairo'),),
              VerticalDivider(color: Colors.white,),
              Container(
                alignment: Alignment.center,
                height: 40,
                
                width: 90,
                decoration: BoxDecoration(
                  
                  border: Border.all(width: 3,color: Colors.brown)
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
      items: Souar().listSouar
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
          height: 65,
          
          width: double.infinity,
          
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 10 ),
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
                 Container(
                   alignment: Alignment.center,
                   height: 35,
                   width: 80,
                   child:  Text(
                     '${time.year}/${time.month}/${time.day}',style: TextStyle(fontFamily: 'Cairo'),
                   ),
                   decoration: BoxDecoration(

                     border: Border.all(color: Colors.brown,width: 3)
                   ),
                 ),
                 VerticalDivider(color: Colors.white,),
              Text(":اخر اجل يوم     ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,fontFamily: 'Cairo'),)
              
            ],
          ),
          height: 65,
          
          width: double.infinity,
          
        ),
        Container(
          
          margin: EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 10 ),
                  IconButton(onPressed: () {
                      showTimePicker(
                        context: context,
                         initialTime: TimeOfDay.now()
                         ).then((value) {
                           setState(() {
                             time2=value!;
                           });
                         });
                  }, icon: Icon(Icons.watch_later,color: Colors.brown,)),
                  
                   VerticalDivider(color: Colors.white,),
                   Container(
                   alignment: Alignment.center,
                   height: 35,
                   width: 80,
                   child:  Text("${time2.hour}:${time2.minute}",style: TextStyle(fontFamily: 'Cairo'),),
                   decoration: BoxDecoration(

                     border: Border.all(color: Colors.brown,width: 3)
                   ),
                 ),
                   
                   VerticalDivider(color: Colors.white,),
                   Text(":على الساعة    ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,fontFamily: 'Cairo'),),
                   
                ],
              )
            ],
          ),
          height: 65,
         
          width: double.infinity,
          
        ),
        
          Divider(color: Colors.black,height: 10,thickness: 1,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.topRight,
          child: Text(": قائمة التلاميذ   ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Cairo'),),
          height: 33,
          width: double.infinity,
          
        ),
        Container(
          height: 260,
          width: double.infinity,
          
          child: FutureBuilder<List<student>>(
            future: getstudent(context),
            builder: (context,snapchot){
              final students=snapchot.data;
              return ListView.builder(
            itemCount: students?.length ?? 0,
            itemBuilder :(context, index) {
              final student=students![index];
             return Container(
               child: Row(children: [
                 Container(
                   margin: EdgeInsets.symmetric(horizontal: 5),
                   child: Row(mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Icon(Icons.send),
                       Container(
                         margin: EdgeInsets.only(top: 15),
                         child: Column(
                         children: [
                           Container(
                             alignment: Alignment.centerRight,
                             
                             width: 270,
                             child:Text(student.username,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,fontFamily: 'Cairo'),),
                           ),
                           Divider(height: 8,),
                           Container(
                             alignment: Alignment.centerRight,
                             
                             width: 130,
                             
                           ),
                          
                         ],
                       ),
                       ),
                       VerticalDivider(color: Colors.grey,),
                         CircleAvatar(child: Icon(Icons.person,color: Colors.black,size: 30,),backgroundColor: Color.fromARGB(255, 240, 238, 238),radius: 25,),
                     ],
                   )
                 )
               ],
               mainAxisAlignment:MainAxisAlignment.end
               ),
                height: 60,
                color: Colors.grey,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
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
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
          
        }, label: Text("  ارسال  ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),icon: Icon(Icons.send,size: 30,),backgroundColor: Colors.brown[400],),
         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class doaah extends StatefulWidget {
  doaah({Key? key}) : super(key: key);

  @override
  State<doaah> createState() => _doaahState();
}

class _doaahState extends State<doaah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.brown,
      title: Container(width: double.infinity,alignment: Alignment.center,child: Text("القران الكريم",style: TextStyle(fontFamily: 'Cairo'),),),
      leading: IconButton(icon: Icon(Icons.arrow_back,),onPressed: (){
        Navigator.of(context).pop();
      },),
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
          Container(
            
            height: 100,
            width: double.infinity,
            alignment: Alignment.center,
            child:Container(
              alignment: Alignment.center,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  
                  child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset("img/begging-gesturing-islam-muslim-praying-hands-isolated-illustration-vector-eps-islam-muslim-praying-hands-144447961 (3).jpg",fit: BoxFit.fill,),),
                ),
            
            Text("  دعاء ختم القران   ",style: TextStyle(fontSize: 35,fontFamily: 'Cairo',fontWeight: FontWeight.bold),),
            Container(
                  width: 50,
                  height: 50,
                  
                  child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset("img/begging-gesturing-islam-muslim-praying-hands-isolated-illustration-vector-eps-islam-muslim-praying-hands-144447961 (3).jpg",fit: BoxFit.fill,),),
                ),
              ],),
            )
          ),
         Container(
           alignment: Alignment.centerLeft,
           child:  Column(
            children: [
              Divider(color: Colors.white,),
              Text("لا إله إلا هو المتوحّد في الجلال بكمال الجمال تعظيمًا وتكبيرًا، المتفرّد بتصريف الأحوال ‏على التفصيل والإجمال تقديرًا وتدبيرًا، المتعالي بعظمته ومجده الذي نزلَّ الفرقان على عبده ليكون للعالمين نذيرًا، ‏وصدق رسوله صلّى الله عليه وسلم الذي أرسله إلى جميع الثقلين، الإنس والجن، بشيرًا ونذيرًا، وداعيًا إلى الله بإذنه ‏وسراجًا منيرًا، صدق الله العظيم التوّاب الغفور الوهّاب الذي خضعت لعظمته الرّقاب، وذلّت لجبروته الصّعاب، ولانت لقدرته الشّدائد الصلاب، ربّ الأرباب ومسبّب الأسباب، ومنزّل الكتاب، وخالق خلقه من تراب، غافر الذّنب، وقابل ‏التوبة شديد العقاب، ذو الطول لا إله إلا هو عليه توكّلت وإليه المتاب، صدق من لم يزل جليلًا، صدق حسبي به كفيلًا، ‏صدق من اتّخذته وكيلًا، صدق الهادي إليه سبيلًا، صدق الله ومن أصدق من الله قيلًا.",style: TextStyle(fontFamily: 'Cairo',fontSize: 15,fontWeight: FontWeight.w600),),
              Text("اللهم ارحمني بالقرآن، واجعله لي إمامًا ونورًا وهدىً ورحمة، اللهمّ ذكّرني منه ما نسيت، وعلّمني منه ما جهلت، وارزقني تلاوته آناء الليل وأطراف النّهار، واجعله لي حجّةً يا ربّ العالمين، اللهمّ أصلح لي ديني الذي هو عصمة أمري، وأصلح لي دنياي التي فيها معاشي، وأصلح لي آخرتي التي فيها معادي، واجعل الحياة زيادة لي في كلّ خير، واجعل الموت راحة لي من كلّ شر.اللهمّ اجعل خير عمري آخره، وخير عملي خواتمه، وخير أيّامي يوم ألقاك فيه.",style: TextStyle(fontFamily: 'Cairo',fontSize: 15,fontWeight: FontWeight.w600),),
              Text("اللهمّ إنّي أسألك عيشةً هنيّةً، وميتة سويّة، ومرادًا غير مخزٍ ولا فاضح، اللهمّ إنّي أسألك خير المسألة وخير الدعاء، وخير النّجاح، وخير العلم، وخير العمل، وخير الثّواب، وخير الحياة، وخير الممات، وثبّتني وثقّل موازيني، وحقّق أمانيي، وارفع درجاتي، وتقبّل صلاتي، واغفر لي خطيئاتي، وأسألك العلا من الجنة. اللهمّ إنّي أسألك موجبات رحمتك، وعزائم مغفرتك، والسلامة من كلّ إثمٍ، والغنيمة من كلّ برٍّ، والفوز بالجنّة، والنجاة من النار، اللهمّ أحسن عاقبتنا في الأمور كلّها، وأجرنا من خزي الدّنيا وعذاب الآخرة.",style: TextStyle(fontFamily: 'Cairo',fontSize: 15,fontWeight: FontWeight.w600),),
              Text("اللهم اقسم لنا من خشيتك ما تحول به بيننا وبين معصيتك، ومن طاعتك ما تبلّغنا بها جنتك، ومن اليقين ما تهون به علينا من مصائب الدنيا، ومتّعنا بأسماعنا وأبصارنا وقوتنا ما أحييتنا، واجعله الوارث منّا، واجعل ثأرنا على من ظلمنا، وانصرنا على من عادانا، ولا تجعل مصيبتنا في ديننا، ولا تجعل الدّنيا أكبر همّنا ولا مبلغ علمنا، ولا تسلّط علينا من لا يرحمنا.",style: TextStyle(fontFamily: 'Cairo',fontSize: 15,fontWeight: FontWeight.w600),),
              Text(" اللهمّ لا تدع لنا ذنبًا إلا غفرته ولا همًّا إلّا فرّجته، ولا دَينًا إلا قضيته، ولا حاجةً من حوائج الدنيا والآخرة هى لك رضىً إلّا قضيتها يا أرحم الراحمين، رّبنا آتنا في الدّنيا حسنة، وفي الآخرة حسنة، وقِنا عذاب النّار، وصلِّ الله على نبيّنا محمّد وعلى آله وأصحابه الأخيار، وسلّم تسليمًا كثيرًا. اللهمّ ارحمني بالقرآن، واجعله لي إمامًا و نورًا، اللهمّ ارحمني بالقرآن واجعله لي إمامًا ونورًا وهدىً ورحمة.",style: TextStyle(fontFamily: 'Cairo',fontSize: 15,fontWeight: FontWeight.w600),)
            ],
          ),
         )
           
        ],
      ),
              
              
              
            )
          )
        ],
        ),
      ),
    );

  }
}
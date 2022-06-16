import '../utils/client.dart';
import '../utils/prefs.dart';
import 'package:flutter/material.dart';

import '../utils/getters.dart';
import '../models/users.dart';
import '../widgets/scaffold.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  Future createTest() async {
    List<int> students = [];
    selectedStudents.forEach(
      (int key, bool value) {
        if (value) students.add(key);
      },
    );
    await client.post('/tests/', body: {
      'teacherId': Globals.userId,
      'question': questionContoller.text,
      'students': students,
    });
  }

  DateTime time = DateTime.now();
  TimeOfDay time2 = TimeOfDay.now();

  final TextEditingController questionContoller = TextEditingController();
  Map<int, bool> selectedStudents = {};
  String pageTitle = 'اختبار';

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: pageTitle,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.start,
            controller: questionContoller,
            decoration: const InputDecoration(
              fillColor: Colors.brown,
              focusColor: Colors.brown,
              label: Align(
                alignment: Alignment.centerRight,
                child: Text('السؤال'),
              ),
            ),
            cursorColor: Colors.brown,
            minLines: 3,
            maxLines: 3,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () async {
                    DateTime? datetime = await showDatePicker(
                        context: context,
                        initialDate: time,
                        firstDate: time,
                        lastDate: DateTime(2100));
                    setState(
                      () {
                        if (datetime != null) {
                          time = datetime;
                        }
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.calendar_month,
                    color: Colors.brown,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 80,
                  child: Text(
                    '${time.year}/${time.month}/${time.day}',
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.brown, width: 2),
                  ),
                ),
                const Text("اخر اجل يوم")
              ],
            ),
            height: 65,
            width: double.infinity,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () async {
                        var value = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        setState(() {
                          time2 = value!;
                        });
                      },
                      icon: const Icon(
                        Icons.watch_later,
                        color: Colors.brown,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: 80,
                      child: Text("${time2.hour}:${time2.minute}"),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.brown, width: 3),
                      ),
                    ),
                    const VerticalDivider(
                      color: Colors.white,
                    ),
                    const Text("على الساعة"),
                  ],
                )
              ],
            ),
          ),
          const Text(
            "قائمة التلاميذ",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.right,
          ),
          FutureBuilder(
            future: getStudents(),
            builder: (context, AsyncSnapshot<List<User>> snapshot) {
              if (!snapshot.hasData) {
                return const Text('ليس لديك تلاميذ');
              }
              List<User> students = snapshot.data!;
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Directionality(
                    textDirection: TextDirection.rtl,
                    child: CheckboxListTile(
                      value: selectedStudents[students[index].id] ?? false,
                      onChanged: (v) => setState(() {
                        selectedStudents[students[index].id] = v!;
                      }),
                      title: Text(students[index].name),
                      activeColor: Colors.brown,
                    ),
                  ),
                  itemCount: students.length,
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await createTest();
        },
        label: const Text(
          "إرسال",
          style: TextStyle(fontSize: 18),
        ),
        icon: const Icon(Icons.send),
        backgroundColor: Colors.brown,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

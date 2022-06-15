import '../widgets/scaffold.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  Future<List> getstudent(BuildContext context) async {
    return [];
  }

  List<String> soura = [
    'الكهف',
    'مريم',
    'النساء',
    'ال عمران',
    'البقرة',
    'الفاتحة'
  ];

  DateTime time = DateTime.now();
  TimeOfDay time2 = TimeOfDay.now();

  String dropdownValue1 = 'الفاتحة';
  String dropdownValue2 = 'الفاتحة';

  String pageTitle = 'اختبار';

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: pageTitle,
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                      border: Border.all(color: Colors.brown, width: 3),
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.white,
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
                          onPressed: () {
                            showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then((value) {
                              setState(() {
                                time2 = value!;
                              });
                            });
                          },
                          icon: const Icon(
                            Icons.watch_later,
                            color: Colors.brown,
                          )),
                      const VerticalDivider(
                        color: Colors.white,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 35,
                        width: 80,
                        child: Text(
                          "${time2.hour}:${time2.minute}",
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.brown, width: 3)),
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
            Container(
              alignment: Alignment.topRight,
              child: const Text(
                "قائمة التلاميذ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text(
          "ارسال",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(
          Icons.send,
          size: 30,
        ),
        backgroundColor: Colors.brown[400],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

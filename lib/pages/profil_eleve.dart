import 'package:application3/models/users.dart';

import '../widgets/scaffold.dart';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfilEleve extends StatelessWidget {
  final User student;
  const ProfilEleve({required this.student, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: 'الملف الشخصي',
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(
                student.name,
                textAlign: TextAlign.right,
              ),
              trailing: const CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.black,
                ),
                backgroundColor: Colors.grey,
                radius: 50,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Container(
                //   padding: const EdgeInsets.only(right: 70),
                //   child: CircularPercentIndicator(
                //     radius: 40,
                //     center: const Text(
                //       "35%",
                //       style: TextStyle(
                //         fontSize: 22,
                //         fontWeight: FontWeight.w600,
                //       ),
                //     ),
                //     lineWidth: 10,
                //     progressColor: const Color.fromARGB(255, 148, 127, 119),
                //     percent: 0.35,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

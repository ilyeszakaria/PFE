import '../widgets/scaffold.dart';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfilEleve extends StatelessWidget {
  const ProfilEleve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: 'الملف الشخصي',
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 70),
                  child: CircularPercentIndicator(
                    radius: 40,
                    center: const Text(
                      "35%",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    lineWidth: 10,
                    progressColor: const Color.fromARGB(255, 148, 127, 119),
                    percent: 0.35,
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Column(
                    children: [
                      Container(
                        child: const CircleAvatar(
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.black,
                          ),
                          backgroundColor: Colors.grey,
                        ),
                        height: 85,
                        width: 110,
                        margin: const EdgeInsets.only(top: 15),
                      ),
                    ],
                  ),
                  height: 105,
                  width: 105,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

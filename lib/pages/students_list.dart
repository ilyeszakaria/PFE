import 'dart:convert';
import 'package:application3/pages/liste_eleve_invitation.dart';
import 'package:application3/pages/profil_eleve.dart';
import 'package:application3/widgets/scaffold.dart';
import '../models/messageTilawaModel1.dart';
import 'package:flutter/material.dart';

class ListeEleve extends StatefulWidget {
  final String username;
  const ListeEleve({Key? key, required this.username}) : super(key: key);

  @override
  State<ListeEleve> createState() => _ListeEleveState();
}

class _ListeEleveState extends State<ListeEleve> {
  static Future<List<student>> getstudent(BuildContext context) async {
    final assetBundel = DefaultAssetBundle.of(context);
    final data = await assetBundel.loadString('assets/student.json');
    final body = json.decode(data);
    return body.map<student>(student.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: 'قائمة الطلاب',
      body: FutureBuilder<List<student>>(
        future: getstudent(context),
        builder: (context, snapchot) {
          final students = snapchot.data;
          return ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.transparent,
                height: 4,
              );
            },
            itemCount: students?.length ?? 0,
            itemBuilder: (context, index) {
              final student = students![index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ProfilEleve();
                      },
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 55,
                        width: 150,
                        child: Text(
                          student.username,
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 55,
                        child: CircleAvatar(
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          backgroundColor: Color.fromARGB(255, 219, 219, 219),
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    boxShadow: [BoxShadow(blurRadius: 1)],
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

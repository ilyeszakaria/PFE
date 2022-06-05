import 'dart:convert';
import 'package:application3/pages/liste_eleve_invitation.dart';
import 'package:application3/pages/profil_eleve.dart';
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
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "قائمة التلاميذ",
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ListeEleveInvitation();
                  }));
                },
                icon: Icon(Icons.person_add))
          ],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          elevation: 10,
          backgroundColor: Colors.brown[400]),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          height: double.infinity,
          width: double.infinity,
          child: FutureBuilder<List<student>>(
            future: getstudent(context),
            builder: (context, snapchot) {
              final students = snapchot.data;
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.white,
                    height: 2,
                  );
                },
                itemCount: students?.length ?? 0,
                itemBuilder: (context, index) {
                  final student = students![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ProfilEleve(
                          idstudent: student.id,
                          username: widget.username,
                        );
                      }));
                    },
                    child: Container(
                      child: Row(children: [
                        Container(
                          alignment: Alignment.center,
                          height: 55,
                          width: 150,
                          child: Text(
                            student.username,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
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
                      ], mainAxisAlignment: MainAxisAlignment.end),
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          boxShadow: [BoxShadow(blurRadius: 1)],
                          borderRadius: BorderRadius.circular(3)),
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    ),
                  );
                },
              );
            },
          )),
    );
  }
}

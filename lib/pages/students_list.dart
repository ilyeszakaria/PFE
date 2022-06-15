import '../models/users.dart';
import '../pages/profil_eleve.dart';
import '../utils/client.dart';
import '../utils/prefs.dart';
import '../widgets/scaffold.dart';
import 'package:flutter/material.dart';

class StudentsList extends StatelessWidget {
  const StudentsList({Key? key}) : super(key: key);

  Future<List<User>> getStudents() async {
    List data = await client.get('/users/${Globals.userId}/students');
    return data.map<User>((e) => User.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: 'قائمة الطلاب',
      body: FutureBuilder<List<User>>(
        future: getStudents(),
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
                        return const ProfilEleve();
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
                        child: Text(student.name),
                      ),
                      const SizedBox(
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
                    boxShadow: const [BoxShadow(blurRadius: 1)],
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

import 'package:application3/pages/liste_eleve.dart';
import 'package:flutter/material.dart';
import '../doaah.dart';
import '../moshaf.dart';
import '../pages/ListeTestStudent.dart';
import '../pages/conversations.dart';
import '../pages/liste_revision.dart';
import '../pages/settings.dart';

class StudentDrawer extends Drawer {
  StudentDrawer({Key? key}) : super(key: key);
  var drawerItems = [
    {
      'icon': Icons.assignment,
      'title': 'المراجعات',
      'next': const ListeRevision(username: ''),
    },
    {
      'icon': Icons.chat,
      'title': 'المحادثات',
      'next': const Conversation(username: ''),
    },
    {
      'icon': Icons.assignment,
      'title': 'الاختبارات',
      'next': const ListeTestStudent(username: ''),
    },
    {
      'icon': Icons.menu_book,
      'title': 'المصحف',
      'next': Moshaf(),
    },
    {
      'icon': Icons.menu_book,
      'title': 'دعاء الختم',
      'next': Doaah(),
    },
    {
      'icon': Icons.settings,
      'title': 'إعدادات الحساب',
      'next': Settings(username: ''),
    },
    {
      'icon': Icons.exit_to_app,
      'title': 'تسجيل الخروج',
      'next': null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        UserAccountsDrawerHeader(
          accountName: const Text("بغدالي الياس زكريا",
              style: const TextStyle(fontFamily: 'Cairo')),
          accountEmail: const Text("baghdaliilyeszakaria@gmail.com",
              style: TextStyle(fontFamily: 'Cairo')),
          currentAccountPicture: const CircleAvatar(
            child: Icon(
              Icons.person,
              color: Colors.black,
            ),
            backgroundColor: Colors.grey,
          ),
          decoration: BoxDecoration(color: Colors.brown[400]),
        ),
        Expanded(
          child: ListView(
            children: drawerItems.map((Map item) {
              return ListTile(
                title: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      item['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => item['next']));
                },
                leading: Icon(item['icon']),
              );
            }).toList(),
          ),
        ),
      ]),
    );
  }
}

class TeacherDrawer extends StudentDrawer {
  TeacherDrawer({Key? key}) : super(key: key) {
    drawerItems[0] = {
      'icon': Icons.list,
      'title': 'تلاميذي',
      'next': const ListeEleve(username: ''),
    };
  }
}

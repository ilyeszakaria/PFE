import 'package:flutter/material.dart';
import '../utils/client.dart';
import '../utils/prefs.dart';
import '../models/users.dart';
import '../pages/students_list.dart';
import '../pages/login.dart';
import '../pages/moshaf.dart';
import '../pages/liste_test_student.dart';
import '../pages/conversations_list.dart';
import '../pages/revisions_list.dart';
import '../pages/settings.dart';

class StudentDrawer extends Drawer {
  User user;
  StudentDrawer({Key? key, required this.user}) : super(key: key);
  var drawerItems = [
    {
      'icon': Icons.assignment,
      'title': 'المراجعات',
      'next': ListeRevision(),
    },
    {
      'icon': Icons.chat,
      'title': 'المحادثات',
      'next': const ConversationsList(),
    },
    {
      'icon': Icons.assignment,
      'title': 'الاختبارات',
      'next': ListeTestStudent(),
    },
    {
      'icon': Icons.menu_book,
      'title': 'المصحف',
      'next': Moshaf(),
    },
    {
      'icon': Icons.settings,
      'title': 'إعدادات الحساب',
      'next': Settings(),
    },
    {
      'icon': Icons.exit_to_app,
      'title': 'تسجيل الخروج',
      'next': null,
    },
  ];

  Widget _getDrawerItemTitle(titleText) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Text(
          titleText,
          textAlign: TextAlign.right,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var items = drawerItems.map((Map item) {
      return ListTile(
        title: _getDrawerItemTitle(item['title']),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => item['next']));
        },
        leading: Icon(item['icon']),
      );
    }).toList();
    items[items.length - 1] = ListTile(
      title: _getDrawerItemTitle('تسجيل الخروج'),
      onTap: () async {
        await client.post('/logout');
        await clearPrefs();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        );
      },
      leading: const Icon(Icons.exit_to_app),
    );
    return Drawer(
      child: Column(children: [
        UserAccountsDrawerHeader(
          accountName: Text(
            user.name,
          ),
          accountEmail: Text(
            user.email!,
          ),
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
            children: items,
          ),
        ),
      ]),
    );
  }
}

class TeacherDrawer extends StudentDrawer {
  TeacherDrawer({Key? key, required user}) : super(key: key, user: user) {
    drawerItems[0] = {
      'icon': Icons.list,
      'title': 'تلاميذي',
      'next': const ListeEleve(username: ''),
    };
  }
}

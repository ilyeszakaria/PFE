import 'package:application3/home.dart';
import 'utils/prefs.dart';
import 'pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: showLoginPage(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          return snapshot.hasData
              ? MaterialApp(
                  theme: ThemeData(
                    primaryColor: Colors.brown,
                  ),
                  home: snapshot.data!
                      ? Home(username: 'username')
                      : const Login(),
                )
              : Container(
                  color: Colors.brown,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
        });
  }
}

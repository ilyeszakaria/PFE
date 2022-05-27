import 'package:flutter/material.dart';

class ScaffoldWidget extends Scaffold {
  String pageTitle;
  ScaffoldWidget({required this.pageTitle, body, Key? key, endDrawer})
      : super(
          key: key,
          body: body,
          endDrawer: endDrawer,
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, kToolbarHeight),
            child: Builder(builder: (context) {
              return AppBar(
                title: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    pageTitle,
                    style: const TextStyle(),
                  ),
                ),
                elevation: 10,
                backgroundColor: Colors.brown[400],
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              );
            }),
          ),
        );

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: appBar,
  //     body: body,
  //   );
  // }
}

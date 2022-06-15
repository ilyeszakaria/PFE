import 'package:flutter/material.dart';

class ScaffoldWidget extends Scaffold {
  ScaffoldWidget({
    required pageTitle,
    body,
    Key? key,
    endDrawer,
    floatingActionButton,
    floatingActionButtonLocation,
  }) : super(
          key: key,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: body,
          ),
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
                backgroundColor: Colors.brown,
                leading: IconButton(
                  icon: const Icon(
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
}

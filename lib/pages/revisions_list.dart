import 'package:flutter/material.dart';

import '../widgets/scaffold.dart';
import '../mixins/chat.dart';
import '../pages/start_revision.dart';

class RevisionsList extends StatelessWidget with TilawaHeadersMixin {
  RevisionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: 'المراجعات',
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const StartRevision();
              },
            ),
          );
        },
        label: const Text(
          "بدء مراجعة",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: const Icon(
          Icons.add,
          size: 30,
        ),
        backgroundColor: Colors.brown,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: tilawatListBuilder(),
    );
  }
}

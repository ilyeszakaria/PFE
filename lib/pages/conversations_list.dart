import 'package:application3/models/messages.dart';
import 'package:application3/utils/client.dart';
import 'package:application3/utils/prefs.dart';
import 'package:application3/widgets/scaffold.dart';
import 'package:flutter/material.dart';

import '../mixins/chat.dart';
import '../widgets/chat.dart';

class ConversationsList extends StatefulWidget {
  final String username;
  const ConversationsList({Key? key, required this.username}) : super(key: key);

  @override
  State<ConversationsList> createState() => _ConversationsListState();
}

class _ConversationsListState extends State<ConversationsList>
    with ChatHeadersMixin {
  // Future<List<ConversationModel>> getConvesationsList() async {
  //   List data = await client.get(
  //     '/conversations/${Globals.userId}?role=${Globals.role}',
  //   );
  //   List<ConversationModel> conversations = data
  //       .map(
  //         (e) => ConversationModel.fromJson(e),
  //       )
  //       .toList();
  //   return conversations;
  // }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: 'المحادثات',
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        height: double.infinity,
        width: double.infinity,
        child: chatListBuilder(),
      ),
    );
  }
}

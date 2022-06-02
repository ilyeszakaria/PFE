import 'package:flutter/material.dart';

import '../widgets/scaffold.dart';
import '../mixins/chat.dart';

class ConversationsList extends StatelessWidget with ChatHeadersMixin {
  const ConversationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: 'المحادثات',
      body: chatListBuilder(),
    );
  }
}

import 'package:application3/models/messages.dart';
import 'package:application3/pages/conversation.dart';
import 'package:application3/utils/client.dart';
import 'package:application3/utils/prefs.dart';
import 'package:application3/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class ConversationsList extends StatefulWidget {
  final String username;
  const ConversationsList({Key? key, required this.username}) : super(key: key);

  @override
  State<ConversationsList> createState() => _ConversationsListState();
}

class _ConversationsListState extends State<ConversationsList> {
  Future<List<ConversationModel>> getConvesationsList() async {
    List data = await client.get(
      '/conversations/${Globals.userId}?role=${Globals.role}',
    );
    List<ConversationModel> conversations = data
        .map(
          (e) => ConversationModel.fromJson(e),
        )
        .toList();
    return conversations;
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: 'المحادثات',
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          height: double.infinity,
          width: double.infinity,
          child: FutureBuilder<List<ConversationModel>>(
            future: getConvesationsList(),
            builder: (context, snapchot) {
              final conversations = snapchot.data;
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.white,
                    height: 2,
                  );
                },
                itemCount: conversations?.length ?? 0,
                itemBuilder: (context, index) {
                  final conversation = conversations![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Conversation(conversation: conversation);
                      }));
                    },
                    child: Container(
                      child: Row(children: [
                        Container(
                          alignment: Alignment.center,
                          height: 55,
                          width: 150,
                          child: Text(
                            conversation.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 55,
                          child: const CircleAvatar(
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
                          boxShadow: [const BoxShadow(blurRadius: 1)],
                          borderRadius: BorderRadius.circular(3)),
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                    ),
                  );
                },
              );
            },
          )),
    );
  }
}

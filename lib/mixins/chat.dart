import 'package:flutter/material.dart';

import '../models/messages.dart';
import '../utils/client.dart';
import '../utils/prefs.dart';
import '../widgets/chat.dart';

mixin ChatHeadersMixin {
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

  Widget chatListBuilder() {
    return FutureBuilder<List<ConversationModel>>(
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
          itemBuilder: (context, index) =>
              ChatHeaderWidget(conversation: conversations![index]),
        );
      },
    );
  }
}

mixin TilawaHeadersMixin {
  Future<List<Tilawa>> getTilawatList() async {
    List data =
        await client.get('/tilawat/${Globals.userId}?role=${Globals.role}');
    List<Tilawa> tilawat = data.map((e) => Tilawa.fromJson(e)).toList();
    return tilawat;
  }

  final noneMessage = 'ليس لديك تصحيحات';
  Widget tilawatListBuilder() {
    return FutureBuilder<List<Tilawa>>(
      future: getTilawatList(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? snapshot.data!.isNotEmpty
                ? ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.white,
                      height: 2,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) =>
                        TilawaHeaderWidget(tilawa: snapshot.data![index]),
                  )
                : Center(
                    child: Text(
                      noneMessage,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

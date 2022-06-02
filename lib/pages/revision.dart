import 'package:application3/mixins/chat.dart';

import '../models/messages.dart';
import 'package:application3/widgets/messages.dart';
import 'package:flutter/material.dart';

class Revision extends StatefulWidget {
  Tilawa tilawa;
  Revision({
    Key? key,
    required this.tilawa,
  }) : super(key: key);

  @override
  State<Revision> createState() => _RevisionState();
}

class _RevisionState extends State<Revision> with MessagesMixin {
  @override
  void initState() {
    super.initState();
    initRecorder();
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }

  @override
  int get chatId => widget.tilawa.id;
  @override
  int get receiverId => 2; //widget.tilawa.other.userId;
  @override
  String get messageType => 'messageTilawa';
  @override
  String get endpoint => '/messages/tilawa';

  @override
  Widget build(BuildContext context) {
    final pageTitle =
        'من ${widget.tilawa.startSora} ${widget.tilawa.startAya} إلى ${widget.tilawa.endSora} ${widget.tilawa.endAya}';
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Center(
          child: Text(
            pageTitle,
            style: const TextStyle(fontSize: 13),
            textWidthBasis: TextWidthBasis.longestLine,
          ),
        ),
        elevation: 10,
        backgroundColor: Colors.brown[400],
      ),
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 600,
            child: FutureBuilder<List<Message>>(
              future: getMessages(),
              builder: (context, snapchot) {
                final messages = snapchot.data;
                return ListView.builder(
                  itemCount: messages?.length ?? 0,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  itemBuilder: (context, index) {
                    var message = messages![index];
                    return message.audio == ''
                        ? TextMessageWidget(message)
                        : AudioMessageWidget(message);
                  },
                );
              },
            ),
          ),
          SizedBox(
            child: StatefulBuilder(builder: (context, _setState) {
              return Column(
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.brown),
                    onPressed: () async {
                      if (recorder.isRecording) {
                        filePath = (await recorder.stopRecorder())!;
                        await sendAudioMessage();
                      } else {
                        await recorder.startRecorder(toFile: filePath);
                      }
                      _setState(() {});
                    },
                    child: Icon(
                      recorder.isRecording ? Icons.stop : Icons.mic,
                    ),
                  ),
                  Timer(recorder: recorder)
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

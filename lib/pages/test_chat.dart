import 'package:flutter/material.dart';
import '../widgets/scaffold.dart';

class TestChat extends StatefulWidget {
  final String username = '';
  const TestChat({
    Key? key,
  }) : super(key: key);

  @override
  State<TestChat> createState() => _TestChatState();
}

class _TestChatState extends State<TestChat> {
  Future<List> getmessageTilawa() async {
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      pageTitle: 'الاختبار 1',
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 600,
            child: FutureBuilder<List>(
              future: getmessageTilawa(),
              builder: (context, snapshot) {
                final messagesTilawa = snapshot.data;
                return ListView.builder(
                  itemCount: messagesTilawa?.length ?? 0,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  itemBuilder: (context, index) {
                    final messageTilawa = messagesTilawa![index];
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Align(
                        alignment: (messageTilawa.sender != widget.username
                            ? Alignment.topLeft
                            : Alignment.topRight),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (messageTilawa.sender != widget.username
                                ? Colors.grey.shade200
                                : Colors.brown[200]),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            messageTilawa.audio,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Icon(
                    Icons.mic,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

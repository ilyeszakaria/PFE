class Message {
  bool seen;
  String text;
  String audio;
  DateTime date = DateTime.now();
  int senderId;

  Message({
    required this.seen,
    required this.text,
    required this.audio,
    required this.senderId,
  });
  static Message fromJson(json) => Message(
        seen: json['seen'],
        text: json['text'],
        audio: json['audio'],
        senderId: json['senderId'],
      );
}

import 'users.dart';

class Message {
  bool seen;
  String text;
  String audio;
  DateTime date = DateTime.now();
  int senderId;

  Message({
    this.seen = false,
    this.audio = '',
    required this.text,
    required this.senderId,
  });
  static Message fromJson(json) => Message(
        text: json['text'],
        audio: json['audio'] ?? '',
        senderId: json['senderId'],
      );
}

class ConversationModel {
  int id;
  User receiver;

  ConversationModel({required this.id, required this.receiver});

  static ConversationModel fromJson(json) => ConversationModel(
        id: json['id'],
        receiver: User.fromJson(json['receiver']),
      );
}

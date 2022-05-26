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
  int studentId;
  int teacherId;
  User other;

  ConversationModel({
    required this.id,
    required this.other,
    required this.studentId,
    required this.teacherId,
  });

  static ConversationModel fromJson(json) => ConversationModel(
        id: json['id'],
        studentId: json['studentId'],
        teacherId: json['teacherId'],
        other: User.fromJson({
          'id': json['otherId'],
          'firstName': json['firstName'],
          'lastName': json['lastName'],
        }),
      );

  get name => other.firstName + ' ' + other.lastName;
}

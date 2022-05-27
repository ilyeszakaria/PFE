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
          'isStudent': json['isStudent'],
          'isTeacher': json['isTeacher'],
        }),
      );

  get name => other.firstName + ' ' + other.lastName;
}

class Tilawa {
  int id;
  int startAya;
  String startSora;
  int endAya;
  String endSora;

  Tilawa({
    required this.id,
    required this.startAya,
    required this.startSora,
    required this.endAya,
    required this.endSora,
  });

  // create fromJson method
  static Tilawa fromJson(json) => Tilawa(
        id: json['id'],
        startAya: json['startAya'],
        startSora: json['startSora'],
        endAya: json['endAya'],
        endSora: json['endSora'],
      );
}

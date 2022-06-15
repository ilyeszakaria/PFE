class TestStudent {
  final String test;
  final String student;
  final String date;
  final String AyaDebut;
  final String AyaFin;
  final String SouraDebut;
  final String SouraFin;
  final String mark;

  const TestStudent(
      {required this.test,
      required this.student,
      required this.date,
      required this.AyaDebut,
      required this.AyaFin,
      required this.SouraDebut,
      required this.SouraFin,
      required this.mark});

  static TestStudent fromJson(json) => TestStudent(
      test: json['test'],
      student: json['student'],
      date: json['date'],
      AyaDebut: json['AyaDebut'],
      AyaFin: json['AyaFin'],
      SouraDebut: json['SouraDebut'],
      SouraFin: json['SouraFin'],
      mark: json['mark']);
}

class TestTeacher {
  final String id;
  final String date;
  final String AyaDebut;
  final String AyaFin;
  final String SouraDebut;
  final String SouraFin;

  const TestTeacher({
    required this.id,
    required this.date,
    required this.AyaDebut,
    required this.AyaFin,
    required this.SouraDebut,
    required this.SouraFin,
  });

  static TestTeacher fromJson(json) => TestTeacher(
        id: json['id'],
        date: json['date'],
        AyaDebut: json['AyaDebut'],
        AyaFin: json['AyaFin'],
        SouraDebut: json['SouraDebut'],
        SouraFin: json['SouraFin'],
      );
}

class Reponce {
  final String username;
  final String test;
  final String student;
  final String mark;

  const Reponce(
      {required this.username,
      required this.test,
      required this.student,
      required this.mark});

  static Reponce formJson(json) => Reponce(
      username: json['username'],
      test: json['test'],
      student: json['student'],
      mark: json['mark']);
}

class MessageTilawa {
  final String sender;
  final String date;
  final String audio;
  final String text;
  final String name;

  const MessageTilawa(
      {required this.sender,
      required this.date,
      required this.audio,
      required this.text,
      required this.name});

  static MessageTilawa fromJson(json) => MessageTilawa(
        sender: json['sender'],
        date: json['date'],
        audio: json['audio'],
        text: json['text'],
        name: json['name'],
      );
}

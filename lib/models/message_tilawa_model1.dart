class TestStudent {
  final String test;
  final String student;
  final String date;
  final String ayaDebut;
  final String ayaFin;
  final String souraDebut;
  final String souraFin;
  final String mark;

  const TestStudent(
      {required this.test,
      required this.student,
      required this.date,
      required this.ayaDebut,
      required this.ayaFin,
      required this.souraDebut,
      required this.souraFin,
      required this.mark});

  static TestStudent fromJson(json) => TestStudent(
      test: json['test'],
      student: json['student'],
      date: json['date'],
      ayaDebut: json['AyaDebut'],
      ayaFin: json['AyaFin'],
      souraDebut: json['SouraDebut'],
      souraFin: json['SouraFin'],
      mark: json['mark']);
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

class MessageTilawa1 {
  final String username;
  final String date;
  final String time;

  const MessageTilawa1(
      {required this.username, required this.date, required this.time});

  static MessageTilawa1 fromJson(json) => MessageTilawa1(
      username: json['username'], date: json['date'], time: json['time']);
}

class Message {
  final String date;
  final String text;
  final String sender;
  final String audio;

  const Message(
      {required this.date,
      required this.text,
      required this.sender,
      required this.audio});

  static Message fromJson(json) => Message(
      sender: json['sender'],
      date: json['date'],
      text: json['text'],
      audio: json['audio']);
}

class Tilawa {
  final String id;
  final String date;
  final String AyaDebut;
  final String AyaFin;
  final String SouraDebut;
  final String SouraFin;

  const Tilawa({
    required this.id,
    required this.date,
    required this.AyaDebut,
    required this.AyaFin,
    required this.SouraDebut,
    required this.SouraFin,
  });

  static Tilawa fromJson(json) => Tilawa(
      id: json['id'],
      date: json['date'],
      AyaDebut: json['AyaDebut'],
      AyaFin: json['AyaFin'],
      SouraDebut: json['SouraDebut'],
      SouraFin: json['SouraFin']);
}

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

class conversation {
  final String id;
  final String username;
  final String date;

  const conversation(
      {required this.id, required this.username, required this.date});

  static conversation fromJson(json) => conversation(
      id: json['id'], username: json['username'], date: json['date']);
}

class student {
  final String id;
  final String username;
  final String firstname;
  final String lastname;

  student({
    required this.id,
    required this.username,
    required this.firstname,
    required this.lastname,
  });

  static student fromJson(json) => student(
      id: json['id'],
      username: json['username'],
      firstname: json['firstname'],
      lastname: json['lastname']);
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
      name: json['name']);
}

class Souar {
  List<String> listSouar = [
    'الناس',
    'الكهف',
    'مريم',
    'النساء',
    'ال عمران',
    'البقرة',
    'الفاتحة'
  ];
}

class user {
  final String Username;
  final String Teacher;
  final String Student;

  const user(
      {required this.Username, required this.Student, required this.Teacher});

  static user fromJson(json) => user(
      Username: json['Username'],
      Student: json['Student'],
      Teacher: json['Teacher']);
}

class sorah {
  final int id;
  final String revelation_place;
  final String name_complex;
  final String name_arabic;

  const sorah(
      {required this.id,
      required this.revelation_place,
      required this.name_complex,
      required this.name_arabic});

  static sorah fromJson(json) => sorah(
      id: json['id'],
      revelation_place: json['revelation_place'],
      name_complex: json['name_complex'],
      name_arabic: json['name_arabic']);
}

class post {
  final int userId;
  final int id;
  final String title;
  final String body;

  const post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  static post fromJson(json) => post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body']);
}

class TestModel {
  int id;
  String question;
  TestModel({
    required this.id,
    required this.question,
  });

  static TestModel fromJson(json) => TestModel(
        id: json['id'],
        question: json['question'],
      );
}

class TestResponse {
  int id;
  String studentName;
  int testId;
  String? audio;
  bool? valid;

  TestResponse({
    required this.id,
    required this.studentName,
    required this.audio,
    required this.testId,
    required this.valid,
  });

  static TestResponse fromJson(json) => TestResponse(
        id: json['id'],
        studentName: json['studentName'],
        audio: json['audio'],
        testId: json['testId'],
        valid: json['valid'],
      );
}

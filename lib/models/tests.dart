class TestModel {
  int id;
  String question;
  TestModel({required this.id, required this.question});

  static TestModel fromJson(json) => TestModel(
        id: json['id'],
        question: json['question'],
      );
}

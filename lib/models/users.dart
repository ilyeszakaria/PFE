class User {
  int id;
  User({required this.id});

  static fromJson(json) => User(id: json['id']);
}

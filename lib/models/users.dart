class User {
  int id;
  String firstName;
  String lastName;
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  static fromJson(json) => User(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
      );
}

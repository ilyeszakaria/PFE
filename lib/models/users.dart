class User {
  int id;
  String firstName;
  String lastName;
  bool isStudent;
  bool isTeacher;
  String? email;
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.isStudent,
    required this.isTeacher,
    this.email,
  });

  static fromJson(Map json) => User(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        isStudent: json['isStudent'],
        isTeacher: json['isTeacher'],
        email: json.containsKey('email') ? json['email'] : null,
      );

  String get name => '$firstName $lastName';
}

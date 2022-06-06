class User {
  int id;
  String firstName;
  String lastName;
  bool isStudent;
  bool isTeacher;
  String? email;
  String? phone;
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.isStudent,
    required this.isTeacher,
    this.email,
    this.phone,
  });

  static fromJson(Map json) => User(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        isStudent: json['isStudent'],
        isTeacher: json['isTeacher'],
        email: json.containsKey('email') ? json['email'] : '',
        phone: json.containsKey('phone') ? json['phone'] ?? '' : '',
      );

  String get name => '$firstName $lastName';
}

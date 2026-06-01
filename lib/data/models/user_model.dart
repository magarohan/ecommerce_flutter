class UserModel {
  final int? id;
  final String username;
  final String email;
  final String password;
  final String? firstname;
  final String? lastname;

  UserModel({
    this.id,
    required this.username,
    required this.email,
    required this.password,
    this.firstname,
    this.lastname,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      firstname: json['name']?['firstname'],
      lastname: json['name']?['lastname'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'name': {'firstname': firstname, 'lastname': lastname},
    };
  }
}

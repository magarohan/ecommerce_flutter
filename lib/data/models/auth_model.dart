class AuthModel {
  final String username;
  final String password;
  final String? token;

  AuthModel({required this.username, required this.password, this.token});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      username: json['username'] ?? '',
      password: json['password'] ?? '',
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }

  AuthModel copyWith({String? username, String? password, String? token}) {
    return AuthModel(
      username: username ?? this.username,
      password: password ?? this.password,
      token: token ?? this.token,
    );
  }
}

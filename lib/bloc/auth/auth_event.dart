abstract class AuthEvent {
  const AuthEvent();
  List<Object?> get props => [];
}

class UserLogin extends AuthEvent {
  final String username;
  final String password;

  const UserLogin({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}

import 'package:ecommerce/core/constants/enums.dart';

class AuthState {
  final AppStatus userLoggedStatus;

  const AuthState({this.userLoggedStatus = AppStatus.initial});

  List<Object> get props => [userLoggedStatus];

  AuthState copyWith({AppStatus? userLoggedStatus}) {
    return AuthState(
      userLoggedStatus: userLoggedStatus ?? this.userLoggedStatus,
    );
  }
}

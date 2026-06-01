import 'package:ecommerce/bloc/auth/auth_event.dart';
import 'package:ecommerce/bloc/auth/auth_state.dart';
import 'package:ecommerce/core/constants/enums.dart';
import 'package:ecommerce/data/models/auth_model.dart';
import 'package:ecommerce/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(const AuthState()) {
    on<UserLogin>(_onLogin);
  }

  Future<void> _onLogin(UserLogin event, Emitter<AuthState> emit) async {
    emit(state.copyWith(userLoggedStatus: AppStatus.loading));
    try {
      await authRepository.login(
        AuthModel(username: event.username, password: event.password),
      );
      emit(state.copyWith(userLoggedStatus: AppStatus.success));
    } catch (e) {
      emit(state.copyWith(userLoggedStatus: AppStatus.failure));
    }
  }
}

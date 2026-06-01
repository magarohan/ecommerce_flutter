import 'package:ecommerce/bloc/users/user_event.dart';
import 'package:ecommerce/bloc/users/user_state.dart';
import 'package:ecommerce/core/constants/enums.dart';
import 'package:ecommerce/data/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(const UserState()) {
    on<UserFetched>(_onUserFetched);
    on<UserAdded>(_onUserAdded);
    on<UserUpdated>(_onUserUpdated);
    on<UserDeleted>(_onUserDeleted);
  }

  Future<void> _onUserFetched(
    UserFetched event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(userFetchedStatus: AppStatus.loading));
    try {
      final user = await userRepository.getUserById(event.id);
      emit(
        state.copyWith(userFetchedStatus: AppStatus.success, userModel: user),
      );
    } catch (e) {
      emit(state.copyWith(userFetchedStatus: AppStatus.failure));
    }
  }

  Future<void> _onUserAdded(UserAdded event, Emitter<UserState> emit) async {
    emit(state.copyWith(userAddedStatus: AppStatus.loading));
    try {
      await userRepository.addUser(event.model);
      emit(state.copyWith(userAddedStatus: AppStatus.success));
    } catch (e) {
      emit(state.copyWith(userAddedStatus: AppStatus.failure));
    }
  }

  Future<void> _onUserUpdated(
    UserUpdated event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(userUpdatedStatus: AppStatus.loading));
    try {
      await userRepository.updateUserById(event.id, event.model);
      emit(state.copyWith(userUpdatedStatus: AppStatus.success));
    } catch (e) {
      emit(state.copyWith(userUpdatedStatus: AppStatus.failure));
    }
  }

  Future<void> _onUserDeleted(
    UserDeleted event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(userDeletedStatus: AppStatus.loading));
    try {
      await userRepository.deleteUserById(event.id);
      emit(state.copyWith(userDeletedStatus: AppStatus.success));
    } catch (e) {
      emit(state.copyWith(userDeletedStatus: AppStatus.failure));
    }
  }
}

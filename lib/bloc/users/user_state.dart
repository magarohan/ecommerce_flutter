import 'package:ecommerce/core/constants/enums.dart';
import 'package:ecommerce/data/models/user_model.dart';

class UserState {
  final AppStatus userFetchedStatus;
  final AppStatus userAddedStatus;
  final AppStatus userUpdatedStatus;
  final AppStatus userDeletedStatus;
  final UserModel? userModel;

  const UserState({
    this.userFetchedStatus = AppStatus.initial,
    this.userAddedStatus = AppStatus.initial,
    this.userUpdatedStatus = AppStatus.initial,
    this.userDeletedStatus = AppStatus.initial,
    this.userModel,
  });

  List<Object?> get props => [
    userFetchedStatus,
    userAddedStatus,
    userUpdatedStatus,
    userDeletedStatus,
    userModel,
  ];

  UserState copyWith({
    AppStatus? userFetchedStatus,
    AppStatus? userAddedStatus,
    AppStatus? userUpdatedStatus,
    AppStatus? userDeletedStatus,
    UserModel? userModel,
  }) {
    return UserState(
      userFetchedStatus: userFetchedStatus ?? this.userFetchedStatus,
      userAddedStatus: userAddedStatus ?? this.userAddedStatus,
      userUpdatedStatus: userUpdatedStatus ?? this.userUpdatedStatus,
      userDeletedStatus: userDeletedStatus ?? this.userDeletedStatus,
      userModel: userModel ?? this.userModel,
    );
  }
}

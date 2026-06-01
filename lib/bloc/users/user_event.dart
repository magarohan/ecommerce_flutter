import 'package:ecommerce/data/models/user_model.dart';

abstract class UserEvent {
  const UserEvent();
  List<Object?> get props => [];
}

class UserAdded extends UserEvent {
  final UserModel model;
  const UserAdded({required this.model});

  @override
  List<Object?> get props => [model];
}

class UserFetched extends UserEvent {
  final int id;
  const UserFetched({required this.id});

  @override
  List<Object?> get props => [id];
}

class UserUpdated extends UserEvent {
  final int id;
  final UserModel model;
  const UserUpdated({required this.id, required this.model});

  @override
  List<Object?> get props => [id, model];
}

class UserDeleted extends UserEvent {
  final int id;
  const UserDeleted({required this.id});

  @override
  List<Object?> get props => [id];
}

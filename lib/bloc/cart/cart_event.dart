import 'package:ecommerce/data/models/cart_model.dart';

abstract class CartEvent {
  const CartEvent();
  List<Object?> get props => [];
}

class CartsFetched extends CartEvent {
  const CartsFetched();
}

class CartAdded extends CartEvent {
  final CartModel model;
  const CartAdded({required this.model});

  @override
  List<Object?> get props => [model];
}

class CartFetchedById extends CartEvent {
  final int id;
  const CartFetchedById({required this.id});

  @override
  List<Object?> get props => [id];
}

class CartUpdated extends CartEvent {
  final int id;
  final CartModel model;
  const CartUpdated({required this.id, required this.model});

  @override
  List<Object?> get props => [id, model];
}

class CartDeleted extends CartEvent {
  final int id;
  const CartDeleted({required this.id});

  @override
  List<Object?> get props => [id];
}

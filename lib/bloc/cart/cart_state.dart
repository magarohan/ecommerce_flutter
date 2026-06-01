import 'package:ecommerce/core/constants/enums.dart';
import 'package:ecommerce/data/models/cart_model.dart';

class CartState {
  final AppStatus cartFetchedStatus;
  final AppStatus cartAddedStatus;
  final AppStatus cartUpdatedStatus;
  final AppStatus cartDeletedStatus;
  final List<CartModel> carts;
  final CartModel? cartModel;

  const CartState({
    this.cartFetchedStatus = AppStatus.initial,
    this.cartAddedStatus = AppStatus.initial,
    this.cartUpdatedStatus = AppStatus.initial,
    this.cartDeletedStatus = AppStatus.initial,
    this.carts = const [],
    this.cartModel,
  });

  List<Object?> get props => [
    cartFetchedStatus,
    cartAddedStatus,
    cartUpdatedStatus,
    cartDeletedStatus,
    carts,
    cartModel,
  ];

  CartState copyWith({
    AppStatus? cartFetchedStatus,
    AppStatus? cartAddedStatus,
    AppStatus? cartUpdatedStatus,
    AppStatus? cartDeletedStatus,
    List<CartModel>? carts,
    CartModel? cartModel,
  }) {
    return CartState(
      cartFetchedStatus: cartFetchedStatus ?? this.cartFetchedStatus,
      cartAddedStatus: cartAddedStatus ?? this.cartAddedStatus,
      cartUpdatedStatus: cartUpdatedStatus ?? this.cartUpdatedStatus,
      cartDeletedStatus: cartDeletedStatus ?? this.cartDeletedStatus,
      carts: carts ?? this.carts,
      cartModel: cartModel ?? this.cartModel,
    );
  }
}

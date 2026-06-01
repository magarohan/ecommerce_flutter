import 'package:ecommerce/bloc/cart/cart_event.dart';
import 'package:ecommerce/bloc/cart/cart_state.dart';
import 'package:ecommerce/core/constants/enums.dart';
import 'package:ecommerce/data/repositories/cart_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc(this.cartRepository) : super(const CartState()) {
    on<CartsFetched>(_onCartsFetched);
    on<CartAdded>(_onCartAdded);
    on<CartFetchedById>(_onCartFetchedById);
    on<CartUpdated>(_onCartUpdated);
    on<CartDeleted>(_onCartDeleted);
  }

  Future<void> _onCartsFetched(
    CartsFetched event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(cartFetchedStatus: AppStatus.loading));
    try {
      final carts = await cartRepository.getAllCarts();
      emit(state.copyWith(cartFetchedStatus: AppStatus.success, carts: carts));
    } catch (e) {
      emit(state.copyWith(cartFetchedStatus: AppStatus.failure));
    }
  }

  Future<void> _onCartAdded(CartAdded event, Emitter<CartState> emit) async {
    emit(state.copyWith(cartAddedStatus: AppStatus.loading));
    try {
      await cartRepository.addCart(event.model);
      emit(state.copyWith(cartAddedStatus: AppStatus.success));
    } catch (e) {
      emit(state.copyWith(cartAddedStatus: AppStatus.failure));
    }
  }

  Future<void> _onCartFetchedById(
    CartFetchedById event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(cartFetchedStatus: AppStatus.loading));
    try {
      final cart = await cartRepository.getCartById(event.id);
      emit(
        state.copyWith(cartFetchedStatus: AppStatus.success, cartModel: cart),
      );
    } catch (e) {
      emit(state.copyWith(cartFetchedStatus: AppStatus.failure));
    }
  }

  Future<void> _onCartUpdated(
    CartUpdated event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(cartUpdatedStatus: AppStatus.loading));
    try {
      await cartRepository.updateCartById(event.id, event.model);
      emit(state.copyWith(cartUpdatedStatus: AppStatus.success));
    } catch (e) {
      emit(state.copyWith(cartUpdatedStatus: AppStatus.failure));
    }
  }

  Future<void> _onCartDeleted(
    CartDeleted event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(cartDeletedStatus: AppStatus.loading));
    try {
      await cartRepository.deleteCartById(event.id);
      emit(state.copyWith(cartDeletedStatus: AppStatus.success));
    } catch (e) {
      emit(state.copyWith(cartDeletedStatus: AppStatus.failure));
    }
  }
}

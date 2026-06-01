import 'package:ecommerce/bloc/products/product_event.dart';
import 'package:ecommerce/bloc/products/product_state.dart';
import 'package:ecommerce/core/constants/enums.dart';
import 'package:ecommerce/data/repositories/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc(this.productRepository) : super(const ProductState()) {
    on<ProductsFetched>(_onProductsFetched);
    on<ProductAdded>(_onProductAdded);
    on<SingleProductFetched>(_onSingleProductFetched);
    on<ProductUpdated>(_onProductUpdated);
    on<ProductDeleted>(_onProductDeleted);
  }

  Future<void> _onProductsFetched(
    ProductsFetched event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(productFetchedStatus: AppStatus.loading));
    try {
      final products = await productRepository.getAllProducts();
      emit(state.copyWith(
        productFetchedStatus: AppStatus.success,
        products: products,
      ));
    } catch (e) {
      emit(state.copyWith(productFetchedStatus: AppStatus.failure));
    }
  }

  Future<void> _onProductAdded(
    ProductAdded event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(productAddedStatus: AppStatus.loading));
    try {
      await productRepository.addProduct(event.model);
      emit(state.copyWith(productAddedStatus: AppStatus.success));
    } catch (e) {
      emit(state.copyWith(productAddedStatus: AppStatus.failure));
    }
  }

  Future<void> _onSingleProductFetched(
    SingleProductFetched event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(productFetchedStatus: AppStatus.loading));
    try {
      final product = await productRepository.getProductById(event.id);
      emit(state.copyWith(
        productFetchedStatus: AppStatus.success,
        productModel: product,
      ));
    } catch (e) {
      emit(state.copyWith(productFetchedStatus: AppStatus.failure));
    }
  }

  Future<void> _onProductUpdated(
    ProductUpdated event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(productUpdatedStatus: AppStatus.loading));
    try {
      await productRepository.updateProductById(event.id, event.model);
      emit(state.copyWith(productUpdatedStatus: AppStatus.success));
    } catch (e) {
      emit(state.copyWith(productUpdatedStatus: AppStatus.failure));
    }
  }

  Future<void> _onProductDeleted(
    ProductDeleted event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(productDeletedStatus: AppStatus.loading));
    try {
      await productRepository.deleteProductById(event.id);
      emit(state.copyWith(productDeletedStatus: AppStatus.success));
    } catch (e) {
      emit(state.copyWith(productDeletedStatus: AppStatus.failure));
    }
  }
}

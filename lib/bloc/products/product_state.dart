import 'package:ecommerce/core/constants/enums.dart';
import 'package:ecommerce/data/models/product_model.dart';

class ProductState {
  final AppStatus productFetchedStatus;
  final AppStatus productAddedStatus;
  final AppStatus productUpdatedStatus;
  final AppStatus productDeletedStatus;
  final List<ProductModel> products;
  final ProductModel? productModel;

  const ProductState({
    this.productFetchedStatus = AppStatus.initial,
    this.productAddedStatus = AppStatus.initial,
    this.productUpdatedStatus = AppStatus.initial,
    this.productDeletedStatus = AppStatus.initial,
    this.products = const [],
    this.productModel,
  });

  List<Object?> get props => [
    productFetchedStatus,
    productAddedStatus,
    productUpdatedStatus,
    productDeletedStatus,
    products,
    productModel,
  ];

  ProductState copyWith({
    AppStatus? productFetchedStatus,
    AppStatus? productAddedStatus,
    AppStatus? productUpdatedStatus,
    AppStatus? productDeletedStatus,
    List<ProductModel>? products,
    ProductModel? productModel,
  }) {
    return ProductState(
      productAddedStatus: productAddedStatus ?? this.productAddedStatus,
      productFetchedStatus: productFetchedStatus ?? this.productFetchedStatus,
      productUpdatedStatus: productUpdatedStatus ?? this.productUpdatedStatus,
      productDeletedStatus: productDeletedStatus ?? this.productDeletedStatus,
      products: products ?? this.products,
      productModel: productModel ?? this.productModel,
    );
  }
}

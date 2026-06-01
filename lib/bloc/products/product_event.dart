import 'package:ecommerce/data/models/product_model.dart';

abstract class ProductEvent {
  const ProductEvent();

  List<Object?> get props => [];
}

class ProductsFetched extends ProductEvent {
  const ProductsFetched();
}

class ProductAdded extends ProductEvent {
  final ProductModel model;
  const ProductAdded({required this.model});

  @override
  List<Object?> get props => [model];
}

class SingleProductFetched extends ProductEvent {
  final int id;
  const SingleProductFetched({required this.id});

  @override
  List<Object?> get props => [id];
}

class ProductUpdated extends ProductEvent {
  final int id;
  final ProductModel model;
  const ProductUpdated({required this.id, required this.model});

  @override
  List<Object?> get props => [id, model];
}

class ProductDeleted extends ProductEvent {
  final int id;
  const ProductDeleted({required this.id});

  @override
  List<Object?> get props => [id];
}

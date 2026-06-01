import 'dart:convert';

import 'package:ecommerce/data/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  final String baseUrl = "https://fakestoreapi.com";

  Future<List<ProductModel>> getAllProducts() async {
    final response = await http.get(Uri.parse("$baseUrl/products"));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => ProductModel.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }

  Future<ProductModel> getProductById(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/products/$id"));

    if (response.statusCode == 200) {
      return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load product");
    }
  }

  Future<ProductModel> addProduct(ProductModel model) async {
    final response = await http.post(
      Uri.parse("$baseUrl/products"),
      body: jsonEncode(model.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to add product");
    }
  }

  Future<ProductModel> updateProductById(int id, ProductModel model) async {
    final response = await http.put(
      Uri.parse("$baseUrl/products/$id"),
      body: jsonEncode(model.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update product");
    }
  }

  Future<void> deleteProductById(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/products/$id"));

    if (response.statusCode != 200) {
      throw Exception("Failed to delete product");
    }
  }
}

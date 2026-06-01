import 'dart:convert';

import 'package:ecommerce/data/models/cart_model.dart';
import 'package:http/http.dart' as http;

class CartRepository {
  final String baseUrl = "https://fakestoreapi.com";
  Future<List<CartModel>> getAllCarts() async {
    final response = await http.get(Uri.parse("$baseUrl/carts"));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => CartModel.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load carts");
    }
  }

  Future<CartModel> getCartById(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/carts/$id"));

    if (response.statusCode == 200) {
      return CartModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load cart");
    }
  }

  Future<CartModel> addCart(CartModel model) async {
    final response = await http.post(
      Uri.parse("$baseUrl/carts"),
      body: jsonEncode(model.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return CartModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to add cart");
    }
  }

  Future<CartModel> updateCartById(int id, CartModel model) async {
    final response = await http.put(
      Uri.parse("$baseUrl/carts/$id"),
      body: jsonEncode(model.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return CartModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update cart");
    }
  }

  Future<void> deleteCartById(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/carts/$id"));

    if (response.statusCode != 200) {
      throw Exception("Failed to delete cart");
    }
  }
}

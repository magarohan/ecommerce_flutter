import 'dart:convert';

import 'package:ecommerce/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final String baseUrl = "https://fakestoreapi.com";

  Future<UserModel> getUserById(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/users/$id"));

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load user");
    }
  }

  Future<UserModel> addUser(UserModel model) async {
    final response = await http.post(
      Uri.parse("$baseUrl/users"),
      body: jsonEncode(model.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to add user");
    }
  }

  Future<UserModel> updateUserById(int id, UserModel model) async {
    final response = await http.put(
      Uri.parse("$baseUrl/users/$id"),
      body: jsonEncode(model.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update user");
    }
  }

  Future<void> deleteUserById(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/users/$id"));

    if (response.statusCode != 200) {
      throw Exception("Failed to delete user");
    }
  }
}

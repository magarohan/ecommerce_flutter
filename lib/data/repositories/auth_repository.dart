import 'dart:convert';

import 'package:ecommerce/data/models/auth_model.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final String baseUrl = "https://fakestoreapi.com";

  Future<AuthModel> login(AuthModel model) async {
    final response = await http.post(
      Uri.parse("$baseUrl/auth/login"),
      body: jsonEncode(model.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return model.copyWith(token: data['token']);
    } else {
      throw Exception("Login failed: ${response.body}");
    }
  }
}

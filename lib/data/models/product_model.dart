import 'package:ecommerce/core/constants/enums.dart';

class ProductModel {
  final int? id;
  final String title;
  final double price;
  final String description;
  final Category category;
  final String image;

  ProductModel({
    this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'] ?? '',
      price: (json['price'] as num).toDouble(),
      description: json['description'] ?? '',
      category: _parseCategory(json['category'] ?? ''),
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': _categoryToString(category),
      'image': image,
    };
  }

  static Category _parseCategory(String category) {
    switch (category) {
      case "electronics":
        return Category.electronics;
      case "jewelery":
        return Category.jewelery;
      case "men's clothing":
        return Category.menClothing;
      case "women's clothing":
        return Category.womenClothing;
      default:
        return Category.electronics;
    }
  }

  static String _categoryToString(Category category) {
    switch (category) {
      case Category.electronics:
        return "electronics";
      case Category.jewelery:
        return "jewelery";
      case Category.menClothing:
        return "men's clothing";
      case Category.womenClothing:
        return "women's clothing";
    }
  }
}

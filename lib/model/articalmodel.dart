import 'dart:convert';

import 'package:flutter/services.dart';

class Recipe {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final Nutrition? nutrition;
  bool isFavorite;

  Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    this.nutrition,
    required this.isFavorite,

  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: int.tryParse(json['id'].toString()) ?? 0,
      name: json['name'] as String? ?? 'وصفة غير معروفة',
      description: json['description'] as String? ?? 'لا تتوفر وصفة.',
      imageUrl: json['imageUrl'] as String? ?? 'assets/images/default.png',
      ingredients: List<String>.from(json['ingredients'] ?? []),
      steps: List<String>.from(json['steps'] ?? []),
      nutrition: json['nutrition'] != null ? Nutrition.fromJson(json['nutrition']) : null,
      isFavorite: json['isFavorite'] ??
          false,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'ingredients': ingredients,
      'steps': steps,
    };
  }
}

class Nutrition {
  final int calories;
  final int protein;
  final int prepTime;

  Nutrition({
    required this.calories,
    required this.protein,
    required this.prepTime,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) {
    return Nutrition(
      calories: json['calories'] as int? ?? 0,
      protein: json['protein'] as int? ?? 0,
      prepTime: json['prepTime'] as int? ?? 0,
    );
  }
}

// دالة لتحميل البيانات من JSON
Future<List<Recipe>> fetchRecipes() async {
  final String response = await rootBundle.loadString('assets/recipes.json');
  final data = json.decode(response) as List<dynamic>;

  return data.map((json) => Recipe.fromJson(json)).toList();
}

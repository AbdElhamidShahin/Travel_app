import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'articalmodel.dart';

Future<Map<String, List<Recipe>>> fetchRecipeFromJson(BuildContext context) async {
  try {
    final String response = await rootBundle.loadString('assets/Recipe/recipe.json');
    final data = json.decode(response) as Map<String, dynamic>;
    Map<String, List<Recipe>> recipeMap = data.map((key, value) {
      List<Recipe> recipes = (value as List<dynamic>)
          .map((json) => Recipe.fromJson(json))
          .toList();
      return MapEntry(key, recipes);
    });
    return recipeMap;
  } catch (e) {
    print("Error fetching recipes: $e");
    throw e; // Re-throwing the error for higher-level handling
  }
}

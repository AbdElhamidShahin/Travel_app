import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'articalmodel.dart';
Future<List<Travel>> fetchTravelFromJson(BuildContext context, String category) async {
  try {
    final String response = await rootBundle.loadString('assets/json/travel.json');
    final data = json.decode(response);

    // Print the data to debug and check the structure
    debugPrint('Loaded JSON: $data');

    // Check if the category exists in the JSON
    if (data.containsKey(category)) {
      final categoryData = data[category] as List<dynamic>;
      List<Travel> travel = categoryData.map((json) => Travel.fromJson(json)).toList();
      return travel;
    } else {
      // Log the error when category is not found
      debugPrint('Category "$category" not found in the JSON data.');
      return [];
    }
  } catch (e) {
    debugPrint('Error loading JSON data: $e');
    return [];
  }
}

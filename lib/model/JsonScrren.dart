import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'articalmodel.dart';

Future<List<Travel>> fetchTravelFromJson(BuildContext context) async {
  try {
    final String response =
    await rootBundle.loadString('assets/json/travel.json');
    final data = json.decode(response)['egyptian_landmarks'] as List<dynamic>;
    List<Travel> travel =
    data.map((json) => Travel.fromJson(json)).toList();
    return travel;
  } catch (e) {
    // Log the error for debugging
    debugPrint('Error loading JSON data: $e');
    // Optionally return an empty list or handle the error accordingly
    return [];
  }
}

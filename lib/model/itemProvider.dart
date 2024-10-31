import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'articalmodel.dart';

class ItemProvider with ChangeNotifier {
  List<Recipe> _items = [];

  ItemProvider() {
    _loadItems();
  }

  List<Recipe> get items => _items;

  void addItem(Recipe item) {
    _items.add(item);
    _saveItems();
    notifyListeners();
  }

  void removeItem(Recipe item) {
    _items.remove(item);
    _saveItems();
    notifyListeners();
  }

  void _saveItems() async {
    final prefs = await SharedPreferences.getInstance();
    final data = jsonEncode(_items.map((item) => item.toJson()).toList());
    await prefs.setString('favorite_items', data);
  }

  void _loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('favorite_items');
    if (data != null) {
      final List<dynamic> json = jsonDecode(data);
      _items = json.map((e) => Recipe.fromJson(e)).toList();
      notifyListeners();
    }
  }
}

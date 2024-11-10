import 'dart:convert';

import 'package:Tourism_app/model/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view/Wedget/tabpar.dart';
import '../../view/screens/AccountScreen.dart';
import '../../view/screens/FavoriteScreen.dart';
import '../articalmodel.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit() : super((RecipeInitialState()));

  static RecipeCubit get(context) => BlocProvider.of<RecipeCubit>(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_filled),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_outline_rounded),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: '',
    ),
  ];

  List<Widget> screens = [
    TabBarPage(),
    Favorite(),
    const Settings(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 0) {}
    emit(RecipeBottomnavBarState());
  }

  List<Travel> naturalPlaces = [];
  List<Travel> searchResults = [];

  // دالة لقراءة البيانات من ملف JSON في الـ assets
  Future<void> loadData() async {
    try {
      // قراءة ملف الـ JSON من الـ assets
      String jsonString = await rootBundle.loadString('assets/json/travel.json');

      // تحويل النص إلى Map
      Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

      // التحقق من أن "natural_places" موجود في الـ JSON و تحميل الأماكن من هناك
      if (jsonResponse.containsKey('natural_places')) {
        List<dynamic> placesJson = jsonResponse['natural_places'];

        // تحويل الـ JSON إلى قائمة من كائنات Travel
        naturalPlaces = placesJson.map((data) => Travel.fromJson(data)).toList();

        emit(RecipeInitialState()); // إصدار حالة النجاح
      } else {
        throw Exception('Key "natural_places" not found in JSON');
      }
    } catch (e) {
      print('Error loading JSON data: $e');
      emit(RecipeErrorState(error: 'Error loading data'));
    }
  }

  // دالة للبحث عن الأماكن بناءً على مدخلات المستخدم
  void getSearch(String value) {
    emit(NewsGetSearchLodingState());

    try {
      // تصفية الأماكن بناءً على القيمة المدخلة
      searchResults = naturalPlaces.where((place) {
        final name = place.name.toLowerCase();
        final description = place.description.toLowerCase();
        return name.contains(value.toLowerCase()) || description.contains(value.toLowerCase());
      }).toList();

      emit(NewsGetSearchSuccessState());
    } catch (error) {
      emit(RecipeGetDataErrorState( error.toString()));
    }
  }
}

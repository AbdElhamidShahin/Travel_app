import 'dart:convert';

import 'package:Tourism_app/model/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view/Wedget/tabpar.dart';
import '../../view/screens/AccountScreen.dart';
import '../../view/screens/FavoriteScreen.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit() : super((RecipeIntiatialState()));

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

  List<dynamic> searchData = []; // لتخزين البيانات من ملف JSON
  List<dynamic> searchResults = []; // لتخزين نتائج البحث

  // تحميل البيانات من ملف JSON
  Future<void> loadSearchData() async {
    final String response =
        await rootBundle.loadString('assets/json/travel.json');
    final data = json.decode(response)['egyptian_landmarks'] as List<dynamic>;
    searchData = data;
  }

  void getSearch(String value) {
    emit(NewsGetSearchLodingState());

    try {
      // تصفية البيانات بناءً على القيمة المدخلة
      searchResults = searchData.where((item) {
        final title = item['title']?.toString().toLowerCase() ?? '';
        return title.contains(value.toLowerCase());
      }).toList();

      print('Number of articles: ${searchResults.length}');
      emit(NewsGetSearchSuccessState());
    } catch (error) {
      print('Error: ${error.toString()}');
      emit(NewsGetSearchErrorState(error: error.toString()));
    }
  }
}

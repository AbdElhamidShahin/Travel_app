import 'dart:convert';

import 'package:Tourism_app/model/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view/screens/tabpar.dart';
import '../../view/screens/SettingScreen.dart';
import '../../view/screens/FavoriteScreen.dart';
import '../articalmodel.dart';

class TravelCubit extends Cubit<TravelState> {
  TravelCubit() : super((TravelInitialState()));

  static TravelCubit get(context) => BlocProvider.of<TravelCubit>(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_filled),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_outline_rounded),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline_outlined),
    ),
  ];

  List<Widget> screens = [
    TabBarPage(),
    Favorite(),
    SettingScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 0) {}
    emit(TravelBottomnavBarState());
  }

  List<Travel> naturalPlaces = [];
  List<Travel> searchResults = [];

  Future<void> loadData() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/json/travel.json');
      Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

      if (jsonResponse.containsKey('natural_places')) {
        List<dynamic> placesJson = jsonResponse['natural_places'];
        naturalPlaces =
            placesJson.map((data) => Travel.fromJson(data)).toList();
        emit(TravelInitialState());
      } else {
        throw Exception('Key "natural_places" not found in JSON');
      }
    } catch (e) {
      print('Error loading JSON data: $e');
      emit(TravelErrorState(error: 'Error loading data'));
    }
  }

  void getSearch(String value) {
    emit(TravelGetSearchLodingState());

    if (value.isEmpty) {
      // إذا كانت القيمة المدخلة فارغة، نعرض جميع الأماكن
      searchResults = List.from(naturalPlaces);
      emit(TravelGetSearchSuccessState());
      return;
    }

    try {
      searchResults = naturalPlaces.where((place) {
        final name = place.name.toLowerCase();
        final description = place.description.toLowerCase();
        final location = place.address.toLowerCase(); // مثال لخاصية إضافية
        return name.contains(value.toLowerCase()) ||
            description.contains(value.toLowerCase()) ||
            location.contains(value.toLowerCase());
      }).toList();

      if (searchResults.isEmpty) {
        emit(TravelGetSearchLodingState());
      } else {
        emit(TravelGetSearchSuccessState());
      }
    } catch (error) {
      emit(TravelGetDataErrorState(error.toString()));
    }
  }

  bool isDark = false;

  void changeAppMode() {
    isDark = !isDark;
    emit(AppChangeModeState(isDark));
  }
}

import 'package:Tourism_app/model/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view/Wedget/tabpar.dart';
import '../../view/screens/AccountScreen.dart';
import '../../view/screens/FavoriteScreen.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super((FoodIntiatialState()));

  static FoodCubit get(context) => BlocProvider.of<FoodCubit>(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_filled),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.favorite_outline_rounded), label: 'Favorite'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person_outline), label: 'Account'),
  ];

  List<Widget> screens = [
    TabBarPage(),
    const Favorite(),
    const Settings(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 0) {}
    emit(FoodBottomnavBarState());
  }
}

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../Tab_Bar.dart';
import '../HomePage.dart';
import 'Favorite_Screen.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    const Homepage(),
     Favorite(),
    const Homepage(),
  ];
  // List of widgets to display based on selected index

  // List of icons for the bottom navigation bar
  List<IconData> iconList = [
    Icons.home_filled,
    Icons.search_sharp,
    Icons.bookmark_border,
    Icons.person_outline,
  ];

  // Handle navigation item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(), // تأكد من استخدام الشكل الدائري

        foregroundColor: Colors.white,

        backgroundColor: Color(0xFF2E7D32),
        child: Icon(Icons.explore),
        onPressed: () {
          setState(() {
            _selectedIndex = 4; // Return to the home page
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        inactiveColor: Colors.grey, // لون الأيقونة غير النشطة

        activeColor: Color(0xFF2E7D32),
        iconSize: 28,
        icons: iconList, // List of icons for the navigation bar
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: _onItemTapped, // Set the selected index on tap
        backgroundColor: const Color(0xFFF5F5F5),
        activeIndex: _selectedIndex,
        height: 60, // Show active index
      ),
    );
  }
}

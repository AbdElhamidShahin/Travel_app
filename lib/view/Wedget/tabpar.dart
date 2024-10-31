import 'package:flutter/material.dart';
import '../../model/ImageUpper.dart';
import '../screens/StackScreen.dart';

class TabBarPage extends StatefulWidget {
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [




          Row(
            children: [
              Column(
                children: [
                  Text("Hello,Jayson",style: TextStyle(color: Colors.black),),
                  Icon(Icons.location_on_outlined)
                ,

                ],
              )
            ],
          ),
          // استخدام TextField كبديل لشريط البحث
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Discover your place',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),


          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: TabBar(
              dividerHeight: 0,
              controller: _tabController,
              isScrollable: true,
              indicator: BoxDecoration(
                color: Colors.transparent,
              ),
              labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              tabs: [
                Tab(
                  child: ImageUpper(
                    image: 'Images/Desert.png',
                    text: 'diner',
                    isSelected: _tabController.index == 0,
                  ),
                ),
                Tab(
                  child: ImageUpper(
                    image: 'Images/Mountains.jpeg',
                    text: 'breakfast',
                    isSelected: _tabController.index == 1,
                  ),
                ),
                Tab(
                  child: ImageUpper(
                    image: 'Images/download.jpeg',
                    text: 'desserts',
                    isSelected: _tabController.index == 2,
                  ),
                ),
                Tab(
                  child: ImageUpper(
                    image: 'Images/Lake.jpeg',
                    text: 'SeaFood',
                    isSelected: _tabController.index == 3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Recommended",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                StacksScreen(category: 'diner'),
                StacksScreen(category: 'breakfast'),
                StacksScreen(category: 'desserts'),
                StacksScreen(category: 'SeaFood'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

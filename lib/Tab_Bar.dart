import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/Wedget/Custom_Catogries.dart';
import 'package:tourism_app/Wedget/Custom_Image.dart';
import 'package:tourism_app/Wedget/Custom_ListVeiw_catogary.dart';
import 'package:dio/dio.dart';
import 'package:tourism_app/Wedget/Product_modile.dart';
import 'package:tourism_app/Wedget/dio.dart';

class TabBarPage extends StatefulWidget {
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  late Future<List<DataModel>> futureArticles;


  @override
  void initState() {
    super.initState();
    final dioInstance = Dio(); // إنشاء كائن Dio
    final newsService = NewsService(dioInstance); // تمرير dio إلى NewsService

    // استدعاء دالة getGeneralNews وتمرير الفئة المطلوبة
    futureArticles = newsService.getGenralNews(category: 'general');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: <Widget>[
          ButtonsTabBar(
            backgroundColor: Color(0xFF2E7D32),
            unselectedBackgroundColor: Colors.white,
            labelStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            height: 60,
            radius: 24, // For rounded corners
            tabs: const [
              Tab(
                  child: CustomImage(
                      text: 'All', image: 'assets/Images/download.jpeg')),
              Tab(
                  child: CustomImage(
                      text: 'Mountains',
                      image: 'assets/Images/Mountains.jpeg')),
              Tab(
                  child: CustomImage(
                      text: 'Desert', image: 'assets/Images/Desert.png')),
              Tab(
                  child: CustomImage(
                      text: 'Lake', image: 'assets/Images/Lake.jpeg')),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text('Top Trips',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Spacer(),
              Text('Explore',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey)),
              Icon(Icons.arrow_forward_ios_sharp, size: 14, color: Colors.grey),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: TabBarView(
              children: [
                CustomListViewCatogary(futureArticles: futureArticles),
                CustomListViewCatogary(futureArticles: futureArticles),
                CustomListViewCatogary(futureArticles: futureArticles),
                CustomListViewCatogary(futureArticles: futureArticles),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

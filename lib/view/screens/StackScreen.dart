import 'package:flutter/material.dart';
import '../../model/JsonScrren.dart';
import '../../model/articalmodel.dart';
import '../Wedget/CustomCatogries.dart';
import '../Wedget/CustomCutogarisDoun.dart';

class StacksScreen extends StatelessWidget {
  final String category;

  StacksScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, List<Recipe>>>(
      future: fetchRecipeFromJson(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No recipes found'));
        }

        final items = snapshot.data![category] ?? [];

        return Scaffold(
          body: SingleChildScrollView(
            // إضافة SingleChildScrollView هنا
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.27,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: 200,
                          child: CustomCategories(
                            recipe: items[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  'Tour Packages',
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(), // منع التمرير هنا
                    shrinkWrap: true, // حجم شبكة التبويب يتناسب مع المحتوى
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Customcutogarisdoun(
                          recipe: items[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

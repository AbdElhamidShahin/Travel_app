import 'package:flutter/material.dart';
import 'package:Tourism_app/view/Wedget/CustomCutogarisDoun.dart';
import '../../model/JsonScrren.dart';
import '../../model/articalmodel.dart';
import 'UpperHomepageUi.dart'; // Ensure correct path for UpperHomepageUi.dart
import 'CustomTabbar.dart'; // Ensure correct path for CustomTabbar.dart

class TabBarPage extends StatefulWidget {
  final String? category;

  const TabBarPage({super.key, this.category});

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Upperhomepageui(), // Upper homepage UI
          const SizedBox(height: 16),
          const Customtabbar(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Tour Packages",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
            ),
          ),
          Expanded( // Wrap the main content with Expanded to avoid overflow
            child: SingleChildScrollView(
              child: FutureBuilder<List<Travel>>(
                future: fetchTravelFromJson(context, widget.category ?? "natural_places"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No travel packages found'));
                  }

                  final items = snapshot.data!;

                  return Column(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Customcutogarisdoun(
                            travel: items[index],
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

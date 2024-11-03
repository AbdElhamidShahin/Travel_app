import 'dart:convert';
import 'package:Tourism_app/model/JsonScrren.dart';
import 'package:Tourism_app/model/articalmodel.dart';
import 'package:Tourism_app/view/Wedget/CustomCutogarisDoun.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Wedget/CustomCatogries.dart';


class StacksScreen extends StatelessWidget {
  final String category;

  const StacksScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Travel>>(
      future: fetchTravelFromJson(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No travel packages found'));
        }

        final items = snapshot.data!;

        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.32,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: 250,
                          child: CustomCategories(
                            travel: items[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),


                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child:  Text(
                //     'Tour Packages',
                //     style: TextStyle(color: Colors.black, fontSize: 24,fontWeight: FontWeight.bold),
                //   ),
                // ),
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
            ),
          ),
        );
      },
    );
  }
}
